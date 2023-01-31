import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  String buttonText;
  VoidCallback onPressed;

  FormSubmitButton(this.buttonText, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(vertical: 18)),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ));
  }
}
