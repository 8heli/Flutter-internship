import 'package:flutter/material.dart';

void main() { // starts app //
  runApp(MyApp()); // MyApp is the main widget //
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( // provides screen structure //
        body: Center( // centers the column vertically and horizontally //
          child: Column( // stacks 2 widgets vertically //
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Heli Shah'),
              Text('Welcome to my Flutter app!'),
            ],
          ),
        ),
      ),
    );
  }
}