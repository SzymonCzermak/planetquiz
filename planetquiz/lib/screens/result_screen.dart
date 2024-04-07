import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';
// Załóżmy, że questions jest już zdefiniowane w twoim projekcie
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/first_screen.dart';

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

  @override
  void initState() {
    super.initState();
    hasDiscount = widget.score > 1;
    if (hasDiscount) {
      Future.delayed(const Duration(seconds: 0), () {
        final code = generateDiscountCode();
        setState(() {
          discountCode = code;
          showDiscountCode = true;
        });
        _fadeInDiscountCode();
      });
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
  }

  void _fadeInDiscountCode() {
    setState(() {
      opacityLevel = 1.0;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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
      await dbRef.child('discountCodes').push().set({
        'code': code,
        'used': false,
        'createdAt': ServerValue.timestamp,
      });
    } catch (e) {
      print("Błąd podczas zapisu do bazy danych: $e");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/RBACKGROUND.png"), // Zastąp ścieżką do swojego obrazu tła
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
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value * widget.score / questions.length,
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
                      '${(widget.score / questions.length * 100).round()}%',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 2),
              child: Center(
                child: Text(
                  showDiscountCode
                      ? 'GRATULACJE!\n Twój kod zniżkowy to:\n$discountCode'
                      : '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (widget.score >= 1)
              Lottie.asset('assets/animations/Win.json',
                  width: 100, height: 100, repeat: false)
            else
              Lottie.asset('assets/animations/Loss.json',
                  width: 100, height: 100, repeat: false),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const FirstScreen()),
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
