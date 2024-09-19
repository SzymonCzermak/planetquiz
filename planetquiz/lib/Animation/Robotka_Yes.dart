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
    'SUUUPER! Udało ci sie! \nPamiętaj że zawsze możesz spróbować ponownie!',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showOverlay(context);
    });
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
        top: 375,
        left: 115,
        width: 450,
        child: Material(
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(158, 4, 147, 45), Color.fromARGB(179, 0, 40, 0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color.fromARGB(255, 0, 44, 8), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 40, 59, 43).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: const Color.fromARGB(255, 187, 187, 187), fontSize: 25),
                  ),
                ),
              ),
              Positioned(
                bottom: -38,
                left: 215,
                child: Transform.rotate(
                  angle: 0,
                  child: Container(
                    width: 5,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 0, 107, 9), Color.fromARGB(255, 32, 94, 52)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 186, 186, 186).withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 50,
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
            child: ClipRect(
              child: Transform.translate(
                offset: Offset(0, 30), // Adjust the offset to move the video down
                child: Transform.scale(
                  scale: 1.5, // Adjust the scale factor to zoom in
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
          ),
        ),
      ),
    );
  }
}
