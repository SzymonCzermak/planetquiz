import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/widgets/help_widget.dart';
import 'package:buttons_flutter/buttons_flutter.dart';

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
    var submitTextStyle = TextStyle(
      fontSize: 48,
      letterSpacing: 5,
      color: const Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.w600,
    );

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
                      style: TextStyle(fontSize: 24.0),  // Zwiększ wielkość tekstu, jeśli potrzeba
                      decoration: InputDecoration(
                        labelText: 'Wybierz swoją rolę',
                        labelStyle: TextStyle(fontSize: 25.0),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                      ),
                      items: _nameOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: <Widget>[
                              Icon(_nameIcons[value], size: 24.0),
                              SizedBox(width: 10),
                              Text(
                                value,
                                style: TextStyle(fontSize: 24.0),
                              ),
                            ],
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
  child: Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: orange, // This border color can be adjusted to match your design
      width: 4.0, // Border thickness
    ),
    borderRadius: BorderRadius.circular(15), // Matches the radius of the SliderButton
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topRight,
      colors: [
        violet, // Starting color of the gradient
        Color.fromARGB(255, 252, 252, 252), // Ending color of the gradient, change as needed
      ],
    ),
  ),
  child: SizedBox(
    child: SliderButton(
      action: () async{
        _startQuiz();
        return true; 
      },

      /// Put label over here
      label: Text(
        "Przesuń By Rozpocząć!",
        style: TextStyle(
            color: Colors.white, // Changed text color for better visibility
            fontWeight: FontWeight.w600,
            fontSize: 22,
            fontFamily: 'BungeeSpice'),
      ),
      icon: Center(
          child: Icon(
        Icons.start,
        color: orange, // Ensure 'orange' is defined in your palette
        size: 60.0,
        semanticLabel: 'Text to announce in accessibility modes',
      )),

      /// Change all the color and size from here.
      height: 100,
      width: 450,
      radius: 10,
      buttonColor: grey, // Assuming 'grey' is also defined in your palette
      backgroundColor: violet, // This will be overridden by the outer container's gradient
      highlightedColor: const Color.fromARGB(255, 180, 30, 30),
      baseColor: grey,
    ),
  ),
)

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
