import 'package:flutter/material.dart';
import 'package:planetquiz/Animation/Robotka_HI.dart';
import 'package:planetquiz/route_generator.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/widgets/help_widget.dart';
import 'package:button_animations/button_animations.dart';
import 'package:planetquiz/widgets/no_role_dialog.dart';
import 'package:planetquiz/widgets/role_info.dart';
import 'package:planetquiz/widgets/social_media_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

final List<String> _nameOptions = [
  'KinoManiak',
  'Magik Obiektywu',
  'Malarka Scen',
  'Dźwiękowiec',
  'Scenograf',
];

final Map<String, IconData> _nameIcons = {
  'KinoManiak': Icons.movie,
  'Magik Obiektywu': Icons.camera_alt,
  'Malarka Scen': Icons.brush,
  'Dźwiękowiec': Icons.volume_up,
  'Scenograf': Icons.theaters,
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
    _audioPlayer.setVolume(1.0); // Ustaw maksymalną głośność
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
          createRoute(
            QuizScreen(
              userName: _nameController.text,
              userSurname: _surnameController.text,
              userRole: _selectedName!,
              userRoleIcon: _nameIcons[_selectedName]!,
            ),
          ),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return NoRoleDialog(message: 'Proszę wybrać rolę przed rozpoczęciem quizu.');
        },
      );
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
              top: 10,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/animations/PQGIF2.gif',
                height: 350,
                width: 350,
              ),
            ),
            Positioned(
              top: 315,
              left: 50,
              right: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '🔻Poniej wybierz swoją role🔻',
                    style: TextStyle(
                      fontSize: 32.0, // Rozmiar czcionki
                      color: Colors.white, // Kolor czcionki
                      fontWeight: FontWeight.bold, // Grubość czcionki
                      shadows: [
                        Shadow(
                          blurRadius: 10.0, // Rozmycie cienia
                          color: violet2, // Kolor cienia
                          offset: Offset(2.0, 2.0), // Przesunięcie cienia
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),

                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _nameOptions.sublist(0, 3).map((String value) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0), // Odstęp między przyciskami
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(115, 65), // Stałe wymiary przycisku
                                  backgroundColor: _selectedName == value ? violet : const Color.fromARGB(156, 96, 96, 96),
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0), // Padding przycisków
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), // Zaokrąglenie rogów
                                    side: BorderSide(
                                      color: orange,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedName = value;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(_nameIcons[value], size: 20.0, color: Colors.white), // Zmniejsz rozmiar ikony
                                    SizedBox(height: 3), // Odstęp między ikoną a tekstem
                                    Text(
                                      value,
                                      style: TextStyle(fontSize: 12.0, color: Colors.white), // Zmniejsz rozmiar czcionki
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _nameOptions.sublist(3).map((String value) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0), // Odstęp między przyciskami
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(115, 65), // Stałe wymiary przycisku
                                  backgroundColor: _selectedName == value ? violet : Color.fromARGB(156, 96, 96, 96),
                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0), // Padding przycisków
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), // Zaokrąglenie rogów
                                    side: BorderSide(
                                      color: orange,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedName = value;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(_nameIcons[value], size: 20.0, color: Colors.white), // Zmniejsz rozmiar ikony
                                    SizedBox(height: 3), // Odstęp między ikoną a tekstem
                                    Text(
                                      value,
                                      style: TextStyle(fontSize: 12.0, color: Colors.white), // Zmniejsz rozmiar czcionki
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: orange, // Kolor ramki
      width: 2.0, // Szerokość ramki
    ),
    borderRadius: BorderRadius.circular(40.0), // Zaokrąglenie rogów ramki
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(36.0), // Zaokrąglenie rogów przycisku
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: gold, backgroundColor: violet, // Kolor tekstu
        fixedSize: Size(430, 100), // Rozmiar przycisku uwzględniający szerokość ramki
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.0), // Zaokrąglenie rogów przycisku
        ),
      ),
      onPressed: () {
        _startQuiz();
      },
      child: Text(
        "START",
        style: TextStyle(
          fontFamily: 'BungeeSpice',
          fontSize: 50, // Wielkość tekstu
          fontWeight: FontWeight.bold, // Grubość czcionki
        ),
      ),
    ),
  ),
)





                ],
              ),
            ),
            Positioned(
              bottom: 400,
              right: 345,
              child: SizedBox(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  onPressed: () => showHelpOverlay(context),
                  child: Text(
                    'Jak Grać?',
                    style: TextStyle(
                      color: Colors.white, // Kolor tekstu
                      fontSize: 17, // Zwiększony rozmiar tekstu
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BungeeSpice', // Pogrubienie tekstu
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: violet, // Używamy `Colors.purple` jako odpowiednik `violet`
                    elevation: 2,
                    shadowColor: Color.fromARGB(192, 185, 23, 177),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: orange,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Dodatkowy padding dla większego przycisku
                  ),
                ),
              ),
            ),
            RobotkaAnimationHI(),
            Positioned(
              bottom: 250,
              right: 50,
              child: Text(
                "Zaobserwuj nas na: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0, // Tutaj ustawiamy rozmiar czcionki
                ),
              ),
            ),
            Positioned(
              bottom: 192,
              right: 60,
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText(
                        '  Facebooku!',
                        textStyle: TextStyle(
                          color: Colors.blue, // Ustawienia koloru
                          fontSize: 38.0, // Przykładowy rozmiar czcionki
                          fontWeight: FontWeight.bold, // Przykładowa grubość czcionki
                        ),
                      ),
                      FadeAnimatedText(
                        'Instagramie!',
                        textStyle: TextStyle(
                          color: Colors.pink, // Ustawienia koloru
                          fontSize: 40.0, // Przykładowy rozmiar czcionki
                          fontWeight: FontWeight.bold, // Przykładowa grubość czcionki
                        ),
                      ),
                      FadeAnimatedText(
                        '    TikToku!',
                        textStyle: TextStyle(
                          color: Colors.white, // Ustawienia koloru
                          fontSize: 40.0, // Przykładowy rozmiar czcionki
                          fontWeight: FontWeight.bold, // Przykładowa grubość czcionki
                        ),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              right: 50,
              child: SocialMediaBar(),
            ),
            Positioned(
              bottom: 400,
              right: 135,
              child: SizedBox(
                width: 200,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RoleInfo();
                      },
                    );
                  },
                  child: Text(
                    'Informacje o \n        rolach',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BungeeSpice'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: violet, // Zmienny kolor przycisku, jeśli masz zdefiniowane `violet`
                    padding: EdgeInsets.all(10), // Możesz dostosować padding w zależności od potrzeb
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: orange, // Zmienny kolor ramki, jeśli masz zdefiniowane `orange`
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
