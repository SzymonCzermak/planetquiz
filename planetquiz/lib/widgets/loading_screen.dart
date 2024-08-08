import 'package:flutter/material.dart';
import 'package:planetquiz/styles.dart';

class LoadingDialog extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;
  final Color textColor;

  LoadingDialog({
    this.backgroundColor = violet2,
    this.indicatorColor = orange,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
            SizedBox(height: 20),
            Text(
              'Zliczanie punktów...',
              style: TextStyle(color: textColor, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return LoadingDialog();
    },
  );
}
