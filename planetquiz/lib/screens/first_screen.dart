import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/widgets/help_widget.dart';
import 'package:button_animations/button_animations.dart';
import 'package:planetquiz/widgets/role_info.dart';
import 'package:planetquiz/widgets/social_media_bar.dart';

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
              top: 390, // Adjust as needed to center the elements vertically
              left: 50, // Adjust as needed to center the elements horizontally
              right: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 550.0,
                    child: DropdownButtonFormField<String>(
                      value: _selectedName,
                      style: TextStyle(fontSize: 65.0),  // Zwiększ wielkość tekstu, jeśli potrzeba
                      decoration: InputDecoration(
                        labelText: 'Wybierz swoją rolę:',
                        labelStyle: TextStyle(fontSize: 45.0, color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                      ),
                      hint: Text(
                        'Kliknij Tutaj aby wybrać role!',
                        style: TextStyle(fontSize: 20.0, color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      dropdownColor: Color.fromARGB(216, 27, 0, 53), // Kolor tła paska z rolami
                      items: _nameOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            color: Colors.transparent, // Kolor tła poszczególnych elementów
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0), // Dodaj odstęp pionowy
                              child: Row(
                                children: <Widget>[
                                  Icon(_nameIcons[value], size: 32.0, color: Colors.white), // Kolor ikony
                                  SizedBox(width: 15),
                                  Text(
                                    value,
                                    style: TextStyle(fontSize: 37.0, color: Colors.white), // Kolor tekstu
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedName = newValue;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 40), // Kolor i rozmiar ikony strzałki
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
                          fontFamily: 'BungeeSpice',
                          fontSize: 50, // Wielkość tekstu
                          fontWeight: FontWeight.bold, // Grubość czcionki
                          color: gold, // Kolor tekstu 
                        ),
                      ),
                      onTap: () {_startQuiz();},
                      isMultiColor: true,
                      colors: [
                        violet, violet2
                      ],
                    ),
                  )
                ],
              ),
            ),




            Positioned(
  bottom: 400,
  right: 185,
  child: SizedBox(
    width: 300,
    height: 75,
    child: ElevatedButton(
      onPressed: () => showHelpOverlay(context),
      child: Text(
        'Jak Grać?',
        style: TextStyle(
          color: Colors.white, // Kolor tekstu
          fontSize: 24, // Zwiększony rozmiar tekstu
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
            width: 4, 
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Dodatkowy padding dla większego przycisku
      ),
    ),
  ),
),

            Positioned(
              top: 750, 
              left: 1,
              child: Image(
                image: AssetImage('assets/animations/Robotka.gif'),
                width: 350, 
                height: 350, 
              ),
            ),
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
              )
            ),
            Positioned(
              bottom: 80,
              right: 50,
              child: SocialMediaBar(),
            ),
            Positioned(
              top:  415,
              right: 60,
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
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BungeeSpice'
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: violet, // Zmienny kolor przycisku, jeśli masz zdefiniowane `violet`
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: orange, // Zmienny kolor ramki, jeśli masz zdefiniowane `orange`
                      width: 4,
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