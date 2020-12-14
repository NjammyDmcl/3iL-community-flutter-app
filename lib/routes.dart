import 'package:flutter/material.dart';

import 'ui/login/login.dart';
import 'ui/splash/splash.dart';
import 'ui/home/home.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => Splash(),
    home: (BuildContext context) => Home(),
    login: (BuildContext context) => Login()
  };
}
