import 'package:flutter/material.dart';
import '../helpers/style.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  TextTitle({@required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
            fontSize: size ?? 20,
            color: color ?? black,
            fontWeight: weight ?? FontWeight.bold),
      ),
    );
  }
}
