import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/first_screen.dart';

String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.score});
  final int score;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String discountCode = '';
  bool hasDiscount = false;
  bool showDiscountCode = false;
  double opacityLevel = 0.0;
  bool _showRetryButton = false;
  double progress = 0.0; // Dodane do śledzenia postępu
  Timer? _timer; // Timer dla postępu

  @override
  void initState() {
    super.initState();

    hasDiscount = widget.score > 1;
    if (hasDiscount) {
      final code = generateDiscountCode();
      setState(() {
        discountCode = code;
        showDiscountCode = true;
      });
      _fadeInDiscountCode();
    }

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ))
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.01;
        if (progress >= 1) {
          _timer?.cancel();
          _showRetryButton = true;
        }
      });
    });
  }

  void _fadeInDiscountCode() {
    setState(() {
      opacityLevel = 1.0;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel(); // Upewnij się, że timer jest anulowany
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/RBACKGROUND.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Twój Wynik:',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            // Reszta Twojego widoku...

            // Dodanie CircularProgressIndicator dla odliczania
            if (!_showRetryButton)
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  strokeWidth: 8,
                ),
              ),
            if (_showRetryButton)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()),
                    (Route<dynamic> route) => false,
                  ),
                  child: const Text('Spróbuj Ponownie'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
