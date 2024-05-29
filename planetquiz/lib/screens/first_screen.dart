import 'package:flutter/material.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/widgets/help_widget.dart';
import 'package:button_animations/button_animations.dart';

import '../styles.dart';

final List<String> _nameOptions = [
  'KinoManiak',
  'Magik Obiektywu',
  'Malarka Scen',
];

final Map<String, IconData> _nameIcons = {
  'KinoManiak': Icons.movie,
  'Magik Obiektywu': Icons.camera_alt,
  'Malarka Scen': Icons.brush,
};

String? _selectedName; // Zmienna na wybraną opcję

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer.setVolume(1.0);  // Ustaw maksymalną głośność
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playSound() async {
    await _audioPlayer.play(AssetSource('sounds/Startquiz.mp3'));
  }

  void _startQuiz() {
    if (_selectedName != null) {
      playSound();
      Future.delayed(Duration(seconds: 0), () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => QuizScreen(
              userName: _nameController.text,
              userSurname: _surnameController.text,
              userRole: _selectedName!,
              userRoleIcon: _nameIcons[_selectedName]!,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = 0.0;
              var end = 1.0;
              var curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      });
    } else {
      // Logika, jeśli rola nie jest wybrana, może tu zostać, jeśli potrzebujesz
      // Na przykład: Informacja dla użytkownika, że musi wybrać rolę
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/animations/QuizScreenBackground.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/animations/PQGIF2.gif',
                height: 350,
                width: 350,
              ),
            ),
            Positioned(
              top: 450, // Adjust as needed to center the elements vertically
              left: 50, // Adjust as needed to center the elements horizontally
              right: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 550.0,
                    child: DropdownButtonFormField<String>(
                      value: _selectedName,
                      style: TextStyle(fontSize: 55.0),  // Zwiększ wielkość tekstu, jeśli potrzeba
                      decoration: InputDecoration(
                        labelText: 'Wybierz swoją rolę (↓ kliknij poniżej ↓)',
                        labelStyle: TextStyle(fontSize: 35.0),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                      ),
                      items: _nameOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0), // Dodaj odstęp pionowy
                            child: Row(
                              children: <Widget>[
                                Icon(_nameIcons[value], size: 32.0),
                                SizedBox(width: 15),
                                Text(
                                  value,
                                  style: TextStyle(fontSize: 37.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedName = newValue;
                        });
                      },
                    ),

                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 455,
  decoration: BoxDecoration(
    border: Border.all(
      color: orange, // Kolor ramki
      width: 4.0, // Szerokość ramki
    ),
    borderRadius: BorderRadius.circular(40.0), // Zaokrąglenie rogów ramki
  ),
  child: AnimatedButton(
    borderRadius: 40,
    width: 450,
    height: 100,
    child: Text(
      "START",
      style: TextStyle(
        fontSize: 50, // Wielkość tekstu
        fontWeight: FontWeight.bold, // Grubość czcionki
        color: gold, // Kolor tekstu 
      ),
    ),
    onTap: () {_startQuiz();},
    isMultiColor: true,
    colors: [
      violet, violet
    ],
  ),
)





                ],
              ),
            ),
            Positioned(
              bottom: 70,  // Position from the bottom of the Stack
              right: 50,   // Position from the right of the Stack
              child: SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton(
                  onPressed: () => showHelpOverlay(context),
                  child: Row(
                    children: [
                      Text(
                        'Jak Grać ',
                        style: TextStyle(
                          color:violet,
                          fontSize: 24, // Zwiększony rozmiar tekstu
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BungeeSpice' // Pogrubienie tekstu
                        ),
                      ),
                      Icon(
                        Icons.help_outline_sharp,   // Nazwa ikony
                        size: 1.0,
                        color: violet,   // Wielkość ikony w pikselach
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: violet,
                    elevation: 10, // Dodanie cienia pod przycisku
                    shadowColor: Color.fromARGB(192, 185, 23, 177), // Kolor cienia
                    shape: RoundedRectangleBorder( // Dodanie ramki wokół przycisku
                      borderRadius: BorderRadius.circular(20), // Zaokrąglone rogi
                      side: BorderSide( // Dodanie ramki
                        color: orange, // Kolor ramki
                        width: 4, // Szerokość ramki
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Dodatkowy padding dla większego przycisku
                  ),
                ),
              ),
            ),
            Positioned(
              top: 725, // Możesz zmienić wartości top, left, right zgodnie z potrzebami layoutu
              left: 1,
              child: Image(
                image: AssetImage('assets/animations/Robotka.gif'), // Ścieżka do twojego pliku
                width: 350, // Szerokość obrazka
                height: 350, // Wysokość obrazka// Dopasowanie obrazka
              ),
            ),
          ],
        ),
      ),
    );
  }
}