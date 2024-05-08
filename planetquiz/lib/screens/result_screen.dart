import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/first_screen.dart';
import 'package:planetquiz/widgets/win_widget.dart';

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
                top: 40,
                left: 30,
                right: 30,
                child: const Text(
                  'Twój Wynik:',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 100,
                left: 50,
                right: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        value: _animation.value * widget.score / 10,
                        color: Colors.green,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.score.toString(),
                          style: const TextStyle(fontSize: 75),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${(widget.score / 10 * 100).round()}%',
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
                top: 600,
                left: 30,
                right: 30,
                child: widget.score >= 8
                    ? Image.asset('assets/animations/Win.gif',
                        width: 200, height: 200)
                    : Image.asset('assets/animations/Loss.gif',
                        width: 150, height: 150),
              ),
              Positioned(
                bottom: 200,
                top: 800,
                left: 70,
                right: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons
                        .wine_bar), // Ikona, tutaj używam ikony wina dla przykładu
                    label: const Text('Pokaż kod zniżkowy!'),
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
                      backgroundColor: Colors.purple, // Kolor tła przycisku
                      elevation: 10, // Wysokość cienia
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30) // Zaokrąglenie rogów
                          ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding wewnętrzny
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                top: 900,
                left: 70,
                right: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.refresh), // Dodanie ikony
                    label: const Text('Spróbuj Ponownie'),
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const FirstScreen()),
                      (Route<dynamic> route) => false,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(
                          106, 6, 199, 1), // Kolor tekstu i ikony
                      elevation: 10, // Wysokość cienia
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30) // Zaokrąglenie rogów
                          ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding wewnętrzny
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
