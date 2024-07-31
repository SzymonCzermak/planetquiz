import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

class LoadingScreen extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;
  final Color textColor;

  LoadingScreen({
    this.backgroundColor = violet2,
    this.indicatorColor = orange,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
            SizedBox(height: 20),
            Text(
              'Wczytywanie wyników...',
              style: TextStyle(color: textColor, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
