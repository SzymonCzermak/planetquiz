import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'video_controller.dart';
import 'package:planetquiz/styles.dart';

class RobotkaAnimationYes extends StatefulWidget {
  @override
  _RobotkaAnimationYesState createState() => _RobotkaAnimationYesState();
}

class _RobotkaAnimationYesState extends State<RobotkaAnimationYes> {
  OverlayEntry? _overlayEntry;
  bool _isOverlayVisible = false;
  final List<String> yesMessages = [
    'Świetna robota!',
    'Brawo! Udało się!',
    'Super! Tak trzymaj!',
    'Wspaniale! Kontynuuj!',
    'Dobra robota! Jestem z Ciebie dumna!',
  ];

  @override
  void initState() {
    super.initState();
  }

  void _showOverlay(BuildContext context) {
    if (_isOverlayVisible) return;
    _isOverlayVisible = true;
    _overlayEntry = _createOverlayEntry(context, _getRandomMessage());
    Overlay.of(context)?.insert(_overlayEntry!);
    Future.delayed(Duration(seconds: 2), () {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
        _isOverlayVisible = false;
      }
    });
  }

  String _getRandomMessage() {
    final random = Random();
    return yesMessages[random.nextInt(yesMessages.length)];
  }

  OverlayEntry _createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 465,
        left: 170,
        width: 300,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
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
                bottom: -10,
                left: 125,
                child: Transform.rotate(
                  angle: 3.14 / 4,
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
      create: (_) => VideoControllerProvider('assets/RoboAnim/Robotka_Yes.mp4'),
      child: GestureDetector(
        onTap: () {
          _showOverlay(context);
        },
        child: Container(
          width: 250,
          height: 250,
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
                Consumer<VideoControllerProvider>(
                  builder: (context, videoProvider, child) {
                    if (!videoProvider.controller.value.isInitialized) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return VideoPlayer(videoProvider.controller);
                  },
                ),
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
    );
  }
}
