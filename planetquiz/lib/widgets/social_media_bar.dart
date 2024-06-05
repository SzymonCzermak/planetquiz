import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({Key? key}) : super(key: key);

  void _showQrDialog(BuildContext context, String assetName, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                Text(
                  description,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    assetName,
                    width: 400.0,
                    height: 400.0,
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
                      backgroundColor: Color.fromARGB(127, 177, 176, 176),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: orange,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(60.0), // Adjust as needed
          child: IconButton(
            icon: Image.asset(
              'assets/social/fb.png',
              width: 75.0,
              height: 75.0,
            ),
            onPressed: () => _showQrDialog(context, 'assets/social/facebook_qr.png', 'Zaobserwuj nas na Facebooku!'),
          ),
        ),
        SizedBox(width: 10.0), // Add spacing between buttons
        ClipRRect(
          borderRadius: BorderRadius.circular(60.0), // Adjust as needed
          child: IconButton(
            icon: Image.asset(
              'assets/social/ig.png',
              width: 75.0,
              height: 75.0,
            ),
            onPressed: () => _showQrDialog(context, 'assets/social/instagram_qr.png', 'Zaobserwuj nas na Instagramie!'),
          ),
        ),
        SizedBox(width: 10.0), // Add spacing between buttons
        ClipRRect(
          borderRadius: BorderRadius.circular(60.0), // Adjust as needed
          child: IconButton(
            icon: Image.asset(
              'assets/social/tiktok.png',
              width: 75.0,
              height: 75.0,
            ),
            onPressed: () => _showQrDialog(context, 'assets/social/tiktok_qr.png', 'Zaobserwuj nas na TikToku!'),
          ),
        ),
      ],
    );
  }
}
