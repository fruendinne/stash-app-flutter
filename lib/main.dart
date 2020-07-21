import 'package:flutter/material.dart';
import 'package:stash/routes.dart';
import 'package:stash/themes/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stash',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: "/",
    );
  }
}