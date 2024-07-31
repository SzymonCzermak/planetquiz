import 'dart:math';
import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'video_controller.dart';

class RobotkaAnimationHI extends StatefulWidget {
  @override
  _RobotkaAnimationHIState createState() => _RobotkaAnimationHIState();
}

class _RobotkaAnimationHIState extends State<RobotkaAnimationHI> {
  OverlayEntry? _overlayEntry;
  bool _isOverlayVisible = false;
  final List<String> messages = [
  'Cześć jestem Pixi! Witaj w PlanetQuzie.',
  'Hej! Gotowy na quiz?',
  'Witaj! Zaczynamy zabawę?',
  'Cześć! Sprawdź swoją wiedzę.',
  'Hej! Czas na quiz!',
  'Zobaczmy, co potrafisz!',
  'Witaj ponownie! Gotowy na kolejne wyzwanie?',
  'Cześć! Czy jesteś gotów na quiz?',
  'Hej! Zobaczmy, ile wiesz!',
  'Witaj w PlanetQuzie! Zaczynamy?',
  'Cześć! Jak Ci idzie nauka?',
  'Hej! Czas na testowanie Twojej wiedzy.',
  'Witaj! Gotowy na nowe pytania?',
  'Cześć! Zaczynamy quiz!',
  'Hej! Sprawdźmy Twoje umiejętności.',
  'Witaj! Czy jesteś gotów na wyzwanie?',
  'Cześć! Przygotuj się na quiz!',
  'Hej! Czas na sprawdzenie Twojej wiedzy.',
  'Witaj! Jak Ci idzie? Zobaczmy!',
  'Cześć! Zaczynamy kolejne pytania.',
  'Co mówi ocean do plaży? Nic, tylko falami!',
];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeOverlay(context);
    });
  }

  void _showWelcomeOverlay(BuildContext context) {
    if (_isOverlayVisible) return;
    _isOverlayVisible = true;
    _overlayEntry = _createOverlayEntry(context, _getRandomMessage());
    Overlay.of(context)?.insert(_overlayEntry!);
    Future.delayed(Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isOverlayVisible = false;
    });
  }

  void _showOverlay(BuildContext context) {
    _showWelcomeOverlay(context);
  }

  String _getRandomMessage() {
    final random = Random();
    return messages[random.nextInt(messages.length)];
  }

  OverlayEntry _createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 745,
        left: 30,
        width: 300,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none, // to allow positioning outside the bounds
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: violet2.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 39, 38, 38).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Positioned(
                bottom: -10, // Positioning the tail outside the container
                left: 125,
                child: Transform.rotate(
                  angle: 3.14 / 4, // Rotating the triangle
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: violet2.withOpacity(0.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 39, 38, 38).withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoControllerProvider('assets/RoboAnim/Robotka_IDE.mp4'),
      child: Consumer<VideoControllerProvider>(
        builder: (context, videoProvider, child) {
          if (!videoProvider.controller.value.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Positioned(
                top: 825,
                left: 45,
                child: GestureDetector(
                  onTap: () {
                    _showOverlay(context);
                  },
                  child: Container(
                    width: 225,
                    height: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: orange.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 50,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Stack(
                        children: [
                          VideoPlayer(videoProvider.controller),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(0, 94, 94, 94),
                                    violet2.withOpacity(0.5),
                                  ],
                                  stops: [0.1, 0.9],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
