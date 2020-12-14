import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:template/business_logic/view_model/UserVIew.dart';
import 'package:template/ui/splash/splash.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: UserView())],
        child: Observer(
            name: 'global-observer',
            builder: (context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: Routes.routes,
                home: Splash(),
              );
            }));
  }
}
