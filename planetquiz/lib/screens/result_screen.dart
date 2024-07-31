import 'dart:async';
import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:planetquiz/Animation/Robotka_Sad.dart';
import 'package:planetquiz/Animation/Robotka_Yes.dart';
import 'package:planetquiz/route_generator.dart';
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
        4, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
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
  left: 100,
  right: 100,
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.score} / 13 punktów',
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(width: 10),
          Text(
            '(${(widget.score / 13 * 100).round()}%)',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: orange, width: 4), // Kolor ramki i jej grubość
          borderRadius: BorderRadius.circular(5), // Zaokrąglenie rogów
          boxShadow: [
            BoxShadow(
              color: violet.withOpacity(0.5), // Kolor cienia z przezroczystością
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(4, 4), // Przesunięcie cienia
            ),
          ],
        ),
        child: LinearProgressIndicator(
          value: _animation.value * widget.score / 13,
          color: violet2,
          backgroundColor: Color.fromARGB(197, 193, 192, 192),
        ),
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
              bottom: 250,
              left: 175,
              right: 175,
              child: widget.score >= 8
                  ? RobotkaAnimationYes()
                  : RobotkaAnimationSad(),
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
                            createRoute(const FirstScreen()),
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
