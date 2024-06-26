// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_mMwprkonUctsUlx5tXzAw3PSD3OoK_M',
    appId: '1:535000467603:web:9f5e2a3c58e9b2ff27e566',
    messagingSenderId: '535000467603',
    projectId: 'planetquiz-42c8e',
    authDomain: 'planetquiz-42c8e.firebaseapp.com',
    storageBucket: 'planetquiz-42c8e.appspot.com',
    measurementId: 'G-VSJXKLN7R2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDI87M-COhbD5bJZmd3IAeS56qNf2YIy8U',
    appId: '1:535000467603:android:bf1c72ec92afe2bd27e566',
    messagingSenderId: '535000467603',
    projectId: 'planetquiz-42c8e',
    storageBucket: 'planetquiz-42c8e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-qZLjX76fRxNsR8W2Ad2HoQfXha9OcUI',
    appId: '1:535000467603:ios:516f25580835294727e566',
    messagingSenderId: '535000467603',
    projectId: 'planetquiz-42c8e',
    storageBucket: 'planetquiz-42c8e.appspot.com',
    iosBundleId: 'com.example.planetquiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-qZLjX76fRxNsR8W2Ad2HoQfXha9OcUI',
    appId: '1:535000467603:ios:b69969a4c554ffe827e566',
    messagingSenderId: '535000467603',
    projectId: 'planetquiz-42c8e',
    storageBucket: 'planetquiz-42c8e.appspot.com',
    iosBundleId: 'com.example.planetquiz.RunnerTests',
  );
}
