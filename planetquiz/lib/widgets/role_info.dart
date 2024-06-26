import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

void showRoleInfoDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return RoleInfo();
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

class RoleInfo extends StatelessWidget {
  const RoleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromARGB(144, 56, 15, 133),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
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
            SizedBox(
              height: 850,
              width: 550, // Ograniczenie wysokości okna dialogowego
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "KinoManiak",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.movie, color: Colors.white, size: 30),
                      ],
                    ),
                    Text(
                      "KinoManiak to rola dla miłośników kina, którzy interesują się zarówno klasycznymi, jak i współczesnymi filmami. Osoby pełniące tę rolę powinny mieć wiedzę na temat historii kina, nagród filmowych, reżyserów oraz aktorów.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tematyka pytań:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Nagrody filmowe (np. Oscar za najlepszy film)\n"
                      "Ikoniczne role aktorskie (np. Heath Ledger jako Joker)\n"
                      "Znani reżyserzy (np. Christopher Nolan)\n\n",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Magik Obiektywu",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.camera_alt, color: Colors.white, size: 30),
                      ],
                    ),
                    Text(
                      "Magik Obiektywu to rola dla pasjonatów fotografii. Osoby pełniące tę rolę powinny znać techniki fotograficzne, sprzęt oraz historię fotografii.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tematyka pytań:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Sprzęt fotograficzny (np. obiektywy do portretów)\n"
                      "Techniki fotograficzne (np. long exposure)\n"
                      "Znani fotografowie (np. Robert Capa)\n\n",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Malarka Scen",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.brush, color: Colors.white, size: 30),
                      ],
                    ),
                    Text(
                      "Malarka Scen to rola dla osób zainteresowanych sztuką malarską. Osoby pełniące tę rolę powinny znać techniki malarskie, historię sztuki oraz wybitnych artystów.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tematyka pytań:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Techniki malarskie (np. tempera, fresk)\n"
                      "Sztuka malowania (np. na mokrym tynku)\n"
                      "Znani artyści (np. Georgia O'Keeffe)\n\n",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dźwiękowiec",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.volume_up, color: Colors.white, size: 30),
                      ],
                    ),
                    Text(
                      "Dźwiękowiec to rola dla osób, które pasjonują się nagrywaniem i obróbką dźwięku. Osoby pełniące tę rolę powinny mieć wiedzę na temat technik nagrywania, sprzętu audio oraz postprodukcji dźwięku.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tematyka pytań:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Techniki nagrywania dźwięku\n"
                      "Sprzęt audio (np. mikrofony)\n"
                      "Postprodukcja dźwięku\n\n",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Scenograf",
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.theaters, color: Colors.white, size: 30),
                      ],
                    ),
                    Text(
                      "Scenograf to rola dla osób zajmujących się tworzeniem scenografii filmowej. Osoby pełniące tę rolę powinny znać techniki projektowania, materiały oraz proces tworzenia planów filmowych.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tematyka pytań:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Techniki scenograficzne\n"
                      "Materiały do tworzenia scenografii\n"
                      "Znani scenografowie\n\n",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
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
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                    side: BorderSide(
                      color: orange, // Dodajemy kolorową ramkę
                      width: 4,
                    ),
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
                      'Powrót ',
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
  }
}

class RoleInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Role Info"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showRoleInfoDialog(context),
          child: Text('Show Role Info'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RoleInfoScreen(),
  ));
}
