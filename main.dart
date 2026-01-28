// Main file that runs the program
import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Main widget of the application that configures theme and navigation
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp provides app level configuration like theme and home screen

    debugShowCheckedModeBanner: false,
      title: 'Day 10 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // First screen of the app
    );
  }
}
