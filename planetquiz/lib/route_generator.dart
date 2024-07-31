import 'package:flutter/material.dart';

// Funkcja tworzenia niestandardowego routa
Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.easeInOut;
      var fadeOutTween = Tween<double>(begin: 1.0, end: 0.0).chain(CurveTween(curve: curve));
      var fadeInTween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

      return Stack(
        children: [
          FadeTransition(
            opacity: animation.drive(fadeOutTween),
            child: secondaryAnimation.status == AnimationStatus.forward ? Container(color: Colors.black) : child,
          ),
          FadeTransition(
            opacity: animation.drive(fadeInTween),
            child: child,
          ),
        ],
      );
    },
    transitionDuration: const Duration(seconds: 2), // Czas trwania dla bardziej płynnej animacji
  );
}
