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
    fontSize: 36,
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  items: _nameOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          Icon(_nameIcons[value], size: 24.0),
                          SizedBox(width: 15),
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
                    height: 100,
                    width: 400,
                    text: 'START',
                    isReverse: true,
                    selectedTextColor: Color(0xFFF6E00FF),
                    transitionType: TransitionType.CENTER_LR_IN,
                    textStyle: submitTextStyle,
                    backgroundColor: Color(0xFFFFD531F),
                    borderColor: Colors.white,
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
            bottom: 50,  // Position from the bottom of the Stack
            right: 30,   // Position from the right of the Stack
            child: SizedBox(
              width: 120,
              height: 80,
              child: ElevatedButton(
                onPressed: () => showHelpOverlay(context),
                child: Text('Jak Grać?'),
                style: 
                ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0), backgroundColor: Color.fromARGB(255, 12, 214, 43),
                ),
              ),
            ),
          ),
          Positioned(
            top: 700, // Zmień wartości top, left, right zgodnie z potrzebami layoutu
            left: 100,
            child: Lottie.asset(
              'assets/animations/Robot.json',  // Ścieżka do twojego pliku Lottie
              width: 300,  // Szerokość animacji
              height: 250,  // Wysokość animacji
              fit: BoxFit.fill,  // Dopasowanie animacji
            ),
          ),
        ],
      ),
    ),
  );
}
}
