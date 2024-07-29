import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControllerProvider extends ChangeNotifier {
  late VideoPlayerController _controller;

  VideoControllerProvider(String videoPath) {
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        notifyListeners();
      }).catchError((error) {
        // Obsługa błędów
        print('Error initializing video player: $error');
      });
  }

  VideoPlayerController get controller => _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
