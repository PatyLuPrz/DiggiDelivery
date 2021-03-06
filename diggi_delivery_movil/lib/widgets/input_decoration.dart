import 'package:flutter/material.dart';

class DecorationInputForm {
  final String textLabel;
  final String textHint;
  final IconData icon;
  final double size;
  final Color color;
  final String errorT;
  final String counterT;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  DecorationInputForm(
      {@required this.textLabel,
      @required this.textHint,
      @required this.icon,
      this.size,
      this.color,
      this.errorT,
      this.counterT,
      this.weight});

  InputDecoration decoration() {
    return InputDecoration(
      counterText: counterT,
      errorText: errorT,
      prefixIcon: Icon(icon, color: Colors.black, size: 20),
      filled: true,
      fillColor: Colors.white70,
      hintText: textHint,
      labelStyle: TextStyle(color: Colors.black),
      labelText: textLabel,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
