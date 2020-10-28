import 'package:flutter/material.dart';
import 'package:quizzler/quiz_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
