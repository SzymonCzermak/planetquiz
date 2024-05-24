import 'dart:async';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/first_screen.dart';
import 'package:planetquiz/widgets/win_widget.dart';
import 'package:timer_button/timer_button.dart';
import 'package:planetquiz/styles.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.score,
    required this.userRole,
    required this.userRoleIcon,
  });
  final int score;
  final String userRole;
  final IconData userRoleIcon;
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String discountCode = '';
  bool showDiscountCode = false;
  double opacityLevel = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    if (widget.score >= 8) {
      discountCode = generateDiscountCode();
      showDiscountCode = true;
      _fadeInDiscountCode();
    }
  }

  void _fadeInDiscountCode() {
    setState(() {
      opacityLevel = 1.0;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  String generateDiscountCode() {
    const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    math.Random _rnd = math.Random();
    String code = String.fromCharCodes(Iterable.generate(
        10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    saveDiscountCodeToRealtimeDatabase(code);
    return code;
  }

  Future<void> saveDiscountCodeToRealtimeDatabase(String code) async {
    final dbRef = FirebaseDatabase.instance.ref();
    String formattedDate =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    try {
      await dbRef.child('Kody zniżkowe QUIZ').push().set({
        'Kod Zniżkowy': code,
        'Użyty': false,
        'Data': formattedDate,
      });
    } catch (e) {
      print("Błąd podczas zapisu do bazy danych: $e");
    }
  }

@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/animations/QuizScreenBackground.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 90,
              left: 30,
              right: 30,
              child: const Text(
                'Twój Wynik:',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 200,
              left: 50,
              right: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height:275,
                    width: 275,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      value: _animation.value * widget.score / 10,
                      color: Colors.green,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.score.toString(),
                        style: const TextStyle(fontSize: 75),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${(widget.score / 10 * 100).round()}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 450,
              left: 30,
              right: 30,
              child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 2),
                child: Center(
                  child: showDiscountCode
                      ? Text(
                          '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 550,
              left: 30,
              right: 30,
              child: widget.score >= 8
                  ? Image.asset('assets/animations/RobotkaWin.gif',
                      width: 200, height: 200)
                  : Image.asset('assets/animations/RobotkaWin.gif',
                      width: 200, height: 200),
            ),
            if (widget.score >= 8) 
              Positioned(
  bottom: 250,
  top: 800,
  left: 150,
  right: 150,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), // Consistent with button's border radius
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(187, 0, 187, 0.404), // Adjusted to match a purple color with transparency
            spreadRadius: 15,
            blurRadius: 60,
            offset: Offset(0, 8), // Vertical offset for the shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => WinWidget(
            discountCode: discountCode,
            userRole: widget.userRole,
            userRoleIcon: widget.userRoleIcon,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: violet2,
          elevation: 0, // Remove elevation since we're using a custom shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          shadowColor: Colors.transparent, // Ensuring no shadow from the button itself
          side: BorderSide(color: orange, width: 4), // Adding a subtle border for visual distinction
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 25),
            SizedBox(width: 10),
            Text(
              'Pokaż kod zniżkowy',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.star, size: 25),
          ],
        ),
      ),
    ),
  ),
)

            else // Else clause if the score is less than 8
              Positioned(
                bottom: 275,
  top: 775,
  left: 150,
  right: 150,
                child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
  child: Container(
    // Increase the padding as needed, or adjust here to control spacing inside the container
    padding: const EdgeInsets.all(13.0), // Increased padding inside for more text space
    // Optionally set explicit dimensions or use MediaQuery for responsiveness
    width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
    height: MediaQuery.of(context).size.height * 0.1, // 10% of screen height, adjust as necessary
    decoration: BoxDecoration(
      color: Color.fromARGB(48, 114, 36, 36), // Red background for the text area
      borderRadius: BorderRadius.circular(60), // Rounded corners for the container
      boxShadow: [ // Optional shadow for aesthetic depth
        BoxShadow(
          color: Color.fromARGB(132, 241, 0, 0).withOpacity(0.5),
          spreadRadius: 15,
          blurRadius: 20,
          offset: Offset(0, 5), // Changes position of shadow
        ),
      ],
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "Niestety nie udało sie, Pamiętaj, że zawsze możesz spróbować ponownie!",
          textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
          speed: Duration(milliseconds: 80),
          textAlign: TextAlign.center,
        ),
      ],
      isRepeatingAnimation: false,
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    ),
  ),
),



              ),

            Positioned(
  bottom: 100,
  top: 900,
  left: 150,
  right: 150,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), // Adjusted to fit the button's border radius
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(106, 6, 199, 1).withOpacity(0.5), // Semi-transparent shadow
            spreadRadius: 15,
            blurRadius: 60,
            offset: Offset(0, 8), // Vertical offset for the shadow
          ),
        ],
      ),
      child: Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: orange, // Kolor ramki
      width: 4.0, // Szerokość ramki
    ),
    borderRadius: BorderRadius.circular(64.0), // Promień zaokrąglenia ramki (opcjonalnie)
  ),
  child: TimerButton(
    label: "Spróbuj Ponownie",
    timeOutInSeconds: 5,
    onPressed: () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const FirstScreen()),
        (Route<dynamic> route) => false,
      );
    },
    buttonType: ButtonType.textButton,
    disabledColor: Color.fromARGB(148, 60, 1, 116),
    color: violet,
    activeTextStyle: const TextStyle(
      color: gold,
      fontSize: 24,
      fontFamily: 'BungeeSpice',
    ),
    disabledTextStyle: const TextStyle(
      color: red,
      fontSize: 14,
    ),
  ),
),



    ),
  ),
),

          ],
        ),
      ),
    ),
  );
}


}
