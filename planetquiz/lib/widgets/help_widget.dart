import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void showHelpOverlay(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
  backgroundColor: Color.fromARGB(144, 56, 15, 133),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0)
  ),
  child: Container(
    constraints: BoxConstraints(maxWidth: 600),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(255, 109, 0, 233), width: 4), // Dodanie białej ramki o szerokości 2
      borderRadius: BorderRadius.circular(12.0), // Zaokrąglenie krawędzi
      color: Color.fromARGB(188, 48, 14, 110), // Tło kontenera
    ),
    child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    SizedBox(
      width: double.infinity,  // Zapewnia, że SizedBox zajmie całą dostępną szerokość
      child: Align(
        alignment: Alignment.center,  // Wyśrodkowuje tekst wewnątrz Align
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              "-------EKRAN STARTOWY------\n"
              "1. Kliknij na pasek 'Wybierz swoją rolę'.\n"
              "2. Wybierz nazwę, która jest najbardziej zgodna z tobą!\n"
              "3. Kliknij przycisk 'START'.\n\n"
              "-----QUIZ ZASADY-----\n"
              "1. Przeczytaj pytanie oraz odpowiedzi.\n"
              "2. Wybierz jedną z nich i kliknij 'Następna'\n"
              "3. Kontynuuj, aż poznasz wyniki quizu.\n\n"
              "Jeśli zdobędziesz conajmniej 8 punktów otrzymasz zniżkę na gadżety!'\n\n"
              "POWODZENIA!",
              textStyle: TextStyle(fontSize: 22.0, color: Colors.white),
              speed: Duration(milliseconds: 30),
              textAlign: TextAlign.center, // Dodane wyrównanie do środka
            ),
          ],
          isRepeatingAnimation: false,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
    ),
    SizedBox(height: 20),
    SizedBox(
      width: 180,
      height: 80,
      child: ElevatedButton(
  onPressed: () => Navigator.pop(context),
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 172, 45, 36),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Zaokrąglone rogi
    elevation: 10, // Cień pod przyciskiem
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Większy padding
  ).copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return Color.fromARGB(255, 117, 22, 161); // Ciemniejszy kolor przy naciśnięciu
        return Colors.red; // Domyślny kolor
      },
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ // Tutaj zastąp 'iconName' nazwą ikony, którą chcesz wyświetlić
      SizedBox(width: 10), // Odstęp pomiędzy ikoną a tekstem
      Text(
        'Wróć ',
        style: TextStyle(fontSize: 30),
      ),
      Icon(
      Icons.settings_backup_restore,
      color: Color.fromARGB(255, 255, 255, 255),
      size: 33.0,
    ),

    ],
  ),
),

    ),
  ],
)

  ),
);

    },
  );
}

class HelpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showHelpOverlay(context),
          child: Text('Show Help'),
        ),
      ),
    );
  }
}
