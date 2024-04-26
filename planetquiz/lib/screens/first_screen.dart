import 'package:flutter/material.dart';
import 'package:planetquiz/screens/quiz_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';


final List<String> _nameOptions = [
  'KinoManiak',
  'Magik Obiektywu',
  'Malarka Scen',
  'Mistrz Reżyserii',
  'Władca Tańca',
  'Poeta Ekranu',
  'Wirtuoz Scenariusza'
];

final Map<String, IconData> _nameIcons = {
  'KinoManiak': Icons.movie,
  'Magik Obiektywu': Icons.camera_alt,
  'Malarka Scen': Icons.brush,
  'Mistrz Reżyserii': Icons.camera_roll,
  'Władca Tańca': Icons.directions_run,
  'Poeta Ekranu': Icons.create,
  'Wirtuoz Scenariusza': Icons.assignment
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

  void _startQuiz() {
    if (_selectedName != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => QuizScreen(
          userName: _nameController.text,
          userSurname: _surnameController.text,
          userRole: _selectedName!,
          userRoleIcon: _nameIcons[_selectedName]!,
        ),
      ));
    } else {
      // Tutaj możesz dodać logikę, jeśli rola nie jest wybrana
    }
  }

  @override
  Widget build(BuildContext context) {
    var submitTextStyle = TextStyle(
        fontSize: 36,
        letterSpacing: 5,
        color: const Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.w400,);
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
            // Logo na górze
            Positioned(
              top: 30, // Gwarantuje, że będzie na górze
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/animations/PQGIF2.gif',
                height: 350,
                width: 350,
              ),
            ),
            // Wyśrodkowany kontent
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 550.0,  // Ustaw szerokość na 200 pikseli
                    child:
                  DropdownButtonFormField<String>(
                    value: _selectedName,
                    decoration:
                        InputDecoration(labelText: 'Wybierz swoją rolę'),
                    items: _nameOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              _nameIcons[value],
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedName = newValue;
                      });
                    },
                  )
                  ),
                  SizedBox(height: 50 ,),
                  AnimatedButton(
                onPress: _startQuiz,
                height: 70,
                width: 200,
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
    colors: [Color(0xFFFFD531F), Color(0xFFF6E00FF)], // Customize colors
  ),
              ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
