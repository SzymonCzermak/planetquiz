import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WinWidget extends StatelessWidget {
  final String discountCode;
  final String userRole;
  final IconData userRoleIcon;

  const WinWidget({
    Key? key,
    required this.discountCode,
    required this.userRole,
    required this.userRoleIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    return AlertDialog(
      backgroundColor: Color.fromARGB(226, 0, 0, 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Gratulacje!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('Oto twój kupon rabatowy \n -10% na gadżet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 20),
          Text(
            'Wyciągnij telefon i zrób mu zdjęcie następnie pokaż w sklepiku aby uzyskać zniżkę.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 700,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/animations/Talon.gif"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Rola:', // Role text
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Centers children vertically
                      children: <Widget>[
                        Text(
                          '$userRole', // Role text
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        SizedBox(
                            width:
                                10), // Provides spacing between the text and the icon
                        Icon(userRoleIcon, // Role icon
                            size: 30,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ],
                    ),
                    Text('------------------------------------------------',
                        style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text(
                      'Kod zniżkowy:',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text('$discountCode',
                        style: TextStyle(
                            fontSize: 40,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text('------------------------------------------------',
                        style: TextStyle(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text(
                      'Data:',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      formattedDateTime,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Center(
    child: TextButton(
      child: Text(
        'Powrót',
        style: TextStyle(
          fontFamily: 'BungeeSpice',  // Nazwa czcionki
          fontSize: 22.0,             // Rozmiar czcionki
          fontWeight: FontWeight.bold,// Grubość czcionki
          color: Colors.blue,         // Kolor tekstu
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  ),
      ],
    );
  }
}
