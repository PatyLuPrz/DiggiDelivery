import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.07,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tick1(),
          spacer(),
          line(),
          spacer(),
          tick2(),
          spacer(),
          line(),
          spacer(),
          tick3(),
          spacer(),
        ],
      ),
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: Color.fromRGBO(202, 63, 67, 1.0),
            size: 35.0,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Color.fromRGBO(202, 63, 67, 1.0),
            size: 35.0,
          );
  }

  Widget tick1() {
    return this.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return Container(
      width: 10.0,
    );
  }

  Widget line() {
    return Container(
      // color: Color.fromRGBO(49, 49, 49, 1.0),
      color: Colors.white,
      height: 5.0,
      width: 50.0,
    );
  }
}
