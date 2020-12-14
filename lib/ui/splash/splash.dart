import 'dart:async';
import 'package:flutter/material.dart';

import '../../routes.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(Object context) {
    return Material(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'))),
          ),
          Text(
            '3iL CLUB',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF144c4c),
                fontFamily: 'OpensansCondense'),
          )
        ]));
  }

  startTimer() {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration,
        () => Navigator.of(context).pushReplacementNamed(Routes.login));
  }
}
