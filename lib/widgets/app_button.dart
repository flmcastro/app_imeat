import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  /*Construtor*/
  AppButton(this.text, {this.onPressed, this.color});

  Widget build(BuildContext context) {
    return Container(
        height: 46,
        child: RaisedButton(
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          onPressed: onPressed,
        ));
  }
}
