import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

void showHelpOverlay(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return Dialog(
        backgroundColor: Color.fromARGB(169, 27, 0, 53),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: orange, width: 2),
            borderRadius: BorderRadius.circular(12.0),
            color: Color.fromARGB(169, 27, 0, 53),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
  "-------EKRAN STARTOWY------\n"
  "1. Wybierz swoją role klikając w poszczególny kafelek'.\n"
  "2. Kliknij przycisk 'START' i rozpocznij quiz!.\n\n"
  "-----QUIZ ZASADY-----\n"
  "1. Przeczytaj pytanie oraz odpowiedzi.\n"
  "2. Wybierz jedną z nich i kliknij 'Następna'\n"
  "3. Kontynuuj, aż poznasz wyniki quizu.\n\n"
  "Jeśli zdobędziesz conajmniej 8 punktów otrzymasz zniżkę na gadżety!\n\n"
  "POWODZENIA!",
  style: TextStyle(fontSize: 22.0, color: Colors.white),
  textAlign: TextAlign.center,
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
                    backgroundColor: grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: orange, width: 2),
                    ),
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Color.fromARGB(255, 117, 22, 161);
                        return Color.fromARGB(69, 177, 176, 176);
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Powrót',
                        style: TextStyle(fontSize: 23, fontFamily: 'BungeeSpice'),
                      ),
                      Icon(
                        Icons.settings_backup_restore,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack,
          ),
        ),
        child: child,
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
