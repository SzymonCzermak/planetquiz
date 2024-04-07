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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 50, // Zmienia wysokość AppBar w pionie
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
            image: AssetImage("assets/background5.png"), // Background file path
            fit: BoxFit
                .cover, // Covers the entire container, maintaining the image's aspect ratio
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            // Usunięto mainAxisAlignment, aby logo było na górze
            children: <Widget>[
              Image.asset(
                'assets/LogoQuiz.png', // Path to your logo image
                height: 200, // Adjust the height as needed
                width: 200, // Adjust the width as needed
              ),
              SizedBox(height: 70), // Odstęp między logo a polem wyboru
              DropdownButtonFormField<String>(
                value: _selectedName,
                decoration: InputDecoration(labelText: 'Wybierz swoją rolę'),
                items:
                    _nameOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          _nameIcons[value], // Użyj mapowania do pobrania ikony
                          size: 24.0, // Możesz dostosować rozmiar ikony
                        ),
                        SizedBox(width: 3), // Odstęp między ikoną a tekstem
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
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: _startQuiz,
                child: Text(
                  'Rozpocznij Quiz',
                  style: TextStyle(
                    fontSize: 16, // Ustawienie wielkości czcionki
                    fontWeight: FontWeight.bold, // Pogrubienie czcionki
                    color: Colors.white, // Ustawienie koloru czcionki na biały
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors
                            .deepPurple; // Kolor przycisku gdy jest naciskany
                      }
                      return Colors.transparent; // Przejrzyste tło
                    },
                  ),
                  foregroundColor:
                      MaterialStateProperty.all(Colors.white), // Kolor tekstu
                  overlayColor: MaterialStateProperty.all(
                      Colors.transparent), // Kolor efektu wciśnięcia
                  shadowColor: MaterialStateProperty.all(
                      Colors.transparent), // Usunięcie cienia
                  elevation: MaterialStateProperty.all(
                      0), // Usunięcie efektu uniesienia przycisku
                  side: MaterialStateProperty.all(BorderSide(
                    color: Colors.white, // Kolor obramowania
                    width: 1.0, // Szerokość obramowania
                  )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Bardziej zaokrąglone narożniki
                    ),
                  ),
                ),
              ),

              SizedBox(height: 210),
            ],
          ),
        ),
      ),
    );
  }
}
