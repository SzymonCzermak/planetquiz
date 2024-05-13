import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/widgets/help_widget.dart';

final List<String> _nameOptions = [
  'KinoManiak',
  'Magik Obiektywu',
  'Malarka Scen',
  'Mistrz Reżyserii',
  'Władca Tańca',
  'Poeta Ekranu',
  'Wirtuoz Scenariusza',
  'Czarodziej Montażu',
  'Architekt Opowieści',
  'Kompozytor Nut',
  'Operator Światła',
  'Grafika Wizji',
  'Animator Ruchu',
  'Kreator Charakterów'

];

final Map<String, IconData> _nameIcons = {
  'KinoManiak': Icons.movie,
  'Magik Obiektywu': Icons.camera_alt,
  'Malarka Scen': Icons.brush,
  'Mistrz Reżyserii': Icons.camera_roll,
  'Władca Tańca': Icons.directions_run,
  'Poeta Ekranu': Icons.create,
  'Wirtuoz Scenariusza': Icons.assignment,
  'Czarodziej Montażu': Icons.edit,
  'Architekt Opowieści': Icons.build,
  'Kompozytor Nut': Icons.music_note,
  'Operator Światła': Icons.highlight,
  'Grafika Wizji': Icons.photo_camera,
  'Animator Ruchu': Icons.motion_photos_on,
  'Kreator Charakterów': Icons.face
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
    Future.delayed(Duration(seconds: 1), () {
      // Przejście do ekranu quizu po 1 sekundzie
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => QuizScreen(
          userName: _nameController.text,
          userSurname: _surnameController.text,
          userRole: _selectedName!,
          userRoleIcon: _nameIcons[_selectedName]!,
        ),
      ));
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
            top: 425, // Adjust as needed to center the elements vertically
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
                          SizedBox(width:10  ),
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
                  child: AnimatedButton(
                    onPress: _startQuiz,
                    height: 125,
                    width: 425,
                    text: 'START',
                    isReverse: true,
                    selectedTextColor: Color(0xFFF6E00FF),
                    transitionType: TransitionType.CENTER_LR_IN,
                    textStyle: submitTextStyle,
                    backgroundColor: Color(0xFFFFD531F),
                    borderColor: Color.fromARGB(255, 26, 1, 255),
                    borderWidth: 1,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFFD531F), Color(0xFFF6E00FF)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,  // Position from the bottom of the Stack
            right: 50,   // Position from the right of the Stack
            child: SizedBox(
              width: 175,
              height: 80,
              child: ElevatedButton(
  onPressed: () => showHelpOverlay(context),
  child: Row(
  children: [
    Text(
      '  Jak Grać  ',
      style: TextStyle(
        fontSize: 16, // Zwiększony rozmiar tekstu
        fontWeight: FontWeight.bold, // Pogrubienie tekstu
      ),
    ),
    Icon(
  Icons.help,   // Nazwa ikony
  size: 30.0,   // Wielkość ikony w pikselach
)
, // Ikona pomocnicza
  ],
),
  style: ElevatedButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
    backgroundColor: Color.fromARGB(255, 9, 156, 31),
    elevation: 10, // Dodanie cienia pod przyciskiem
    shadowColor: Color.fromARGB(192, 185, 23, 177), // Kolor cienia
    shape: RoundedRectangleBorder( // Dodanie ramki wokół przycisku
      borderRadius: BorderRadius.circular(20), // Zaokrąglone rogi
      side: BorderSide( // Dodanie ramki
        color: Color.fromARGB(190, 73, 10, 156), // Kolor ramki
        width: 2, // Szerokość ramki
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Dodatkowy padding dla większego przycisku
  ),
)

            ),
          ),
          Positioned(
  top:  700, // Możesz zmienić wartości top, left, right zgodnie z potrzebami layoutu
  left: 1,
  child: Image(
    image: AssetImage('assets/animations/Robotka.gif'), // Ścieżka do twojego pliku
    width: 375, // Szerokość obrazka
    height: 375, // Wysokość obrazka// Dopasowanie obrazka
  ),
),

        ],
      ),
    ),
  );
}
}
