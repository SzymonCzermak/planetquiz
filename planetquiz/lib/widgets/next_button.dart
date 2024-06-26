import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Zaokrąglone rogi, jeśli chcesz
            side: BorderSide(
              color: orange, // Kolor obramowania
              width: 2, // Szerokość obramowania
            ),
          ),
          color: onPressed != null ? Color.fromARGB(133, 104, 14, 156) : Color.fromARGB(155, 70, 6, 107), // Kolor nieaktywny
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
