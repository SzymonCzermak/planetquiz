import 'package:flutter/material.dart';
import 'package:planetquiz/screens/quiz_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        title: Center(
          child: Image.asset(
            'assets/AlverniaLogo.png',
            fit: BoxFit.cover,
            height: 40,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Logo na górze
            Positioned(
              top: 0, // Gwarantuje, że będzie na górze
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/LogoQuiz.png',
                height: 200,
                width: 200,
              ),
            ),
            // Wyśrodkowany kontent
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                  ),
                  ElevatedButton(
                    onPressed: _startQuiz,
                    child: Text(
                      'Rozpocznij Quiz',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
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
