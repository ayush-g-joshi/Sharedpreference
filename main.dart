import 'package:flutter/material.dart';
import "home_screen.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shared Preference Example"),
        ),
        body: HomeScreen(),
      ),
    );
  }
}