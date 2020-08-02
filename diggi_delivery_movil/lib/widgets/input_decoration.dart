import 'package:flutter/material.dart';
import '../helpers/style.dart';

class DecorationInputForm {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  DecorationInputForm(
      {@required this.text, this.size, this.color, this.weight});

  InputDecoration decoration() {
    return InputDecoration(
      labelText: text,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
    );
  }
}
