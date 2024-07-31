import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

class NoRoleDialog extends StatelessWidget {
  final String message;

  const NoRoleDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        backgroundColor: Color.fromARGB(144, 56, 15, 133),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: orange, width: 4),
            borderRadius: BorderRadius.circular(12.0),
            color: Color.fromARGB(169, 27, 0, 53),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 80,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(127, 177, 176, 176),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: orange, width: 4),
                    ),
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) return Color.fromARGB(255, 117, 22, 161);
                        return Color.fromARGB(69, 177, 176, 176);
                      },
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text('Powrót', style: TextStyle(fontSize: 23, fontFamily: 'BungeeSpice')),
                      Icon(Icons.settings_backup_restore, color: Colors.white, size: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
