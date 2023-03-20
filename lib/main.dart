import 'package:busy_reader/pages/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Books',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: SplashScreen());
  }
}
