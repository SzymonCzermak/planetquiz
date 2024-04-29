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
                "This is the help section. Here you can provide useful information or FAQs to help users understand how to use the application.",
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
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
