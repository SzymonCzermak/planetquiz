import 'package:flutter/material.dart';
import 'package:planetquiz/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:
            "AIzaSyDI87M-COhbD5bJZmd3IAeS56qNf2YIy8U", // paste your api key here
        appId:
            "1:535000467603:android:bf1c72ec92afe2bd27e566", //paste your app id here
        messagingSenderId: "535000467603", //paste your messagingSenderId here
        projectId: "planetquiz-42c8e", //paste your project id here
        databaseURL:
            "https://planetquiz-42c8e-default-rtdb.europe-west1.firebasedatabase.app"),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(),
      home: const FirstScreen(),
    );
  }
}
