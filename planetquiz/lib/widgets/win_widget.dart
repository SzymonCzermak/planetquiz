import 'package:flutter/material.dart';

class WinWidget extends StatelessWidget {
  final String discountCode; // Dodanie pola na kod zniżkowy
  const WinWidget({Key? key, required this.discountCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Wygrana!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            const Text('Gratulacje, osiągnąłeś świetny wynik!'),
            Text(
                'Twój kod zniżkowy to: $discountCode'), // Wyświetlanie kodu zniżkowego
            const Text('Czy chcesz spróbować ponownie?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Tak'),
          onPressed: () {
            Navigator.of(context).pop(); // Zamknięcie dialogu
          },
        ),
      ],
    );
  }
}
