import 'package:flutter/material.dart';

void showHelpOverlay(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), // Makes the dialog rounded
        child: Container(
          constraints: BoxConstraints(maxWidth: 600), // Limits the width of the dialog
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Makes the column height just enough for its content
            children: <Widget>[
              Text(
                "------EKRAN STARTOWY-----\n"
                "1.Kliknij na pasek 'Wybierz swoją rolę'.\n"+
                "2.Wybierz nazwe która jest najbardziej zgodna z tobą!\n"+
                "3.Kliknij przycisk 'START'.\n"+
                "\n"+
                "----QUIZ ZASADY------\n"+
                "1.Przeczytaj pytanie oraz odpowiedzi.\n"+
                "2.Wybierz jedną z nich i kliknij 'Następna'\n"+
                "3.Kontynuuj, aż poznasz wyniki quizu.\n",
                
            
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Zamknij'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
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
