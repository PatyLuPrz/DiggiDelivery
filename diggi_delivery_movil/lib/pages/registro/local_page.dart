import 'package:flutter/material.dart';

class LocalRegisgtro extends StatefulWidget {
  LocalRegisgtro({Key key}) : super(key: key);

  @override
  _LocalRegisgtroState createState() => _LocalRegisgtroState();
}

class _LocalRegisgtroState extends State<LocalRegisgtro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          child: Text("Local"),
        )),
      ),
    );
  }
}
