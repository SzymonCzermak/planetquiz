import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'video_controller.dart';

class RobotkaAnimationYes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoControllerProvider('assets/RoboAnim/Robotka_Yes.mp4'),
      child: Consumer<VideoControllerProvider>(
        builder: (context, videoProvider, child) {
          if (!videoProvider.controller.value.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }
          return Positioned(
            top: 10,
            left: 30,
            right: 30,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: orange, // Kolor ramki
                  width: 1.0, // Szerokość ramki
                ),
                borderRadius: BorderRadius.circular(20.0), // Zaokrąglenie rogów ramki
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
