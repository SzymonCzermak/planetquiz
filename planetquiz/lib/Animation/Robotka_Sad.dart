import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'video_controller.dart';

class RobotkaAnimationSad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoControllerProvider('assets/RoboAnim/Robotka_Sad.mp4'),
      child: Consumer<VideoControllerProvider>(
        builder: (context, videoProvider, child) {
          if (!videoProvider.controller.value.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }
          return Positioned(
            top: 495,
            left: 220,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: orange.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Zaokrąglenie rogów wideo
                child: VideoPlayer(videoProvider.controller),
              ),
            ),
          );
        },
      ),
    );
  }
}
