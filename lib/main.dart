import 'package:comfort_sleep/mainscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ComfortSleep());

class ComfortSleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(title: 'Comfort Sleep Application'),
    );
  }
}