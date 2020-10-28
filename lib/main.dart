import 'package:flutter/material.dart';

import 'quiz.dart';

final QuizApp = Quiz();

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildQuestion() => Expanded(
        flex: 5,
        child: Center(
          child: Text(
            QuizApp.getQuestion(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _buildChoice(String choice) => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                QuizApp.addScore(choice);
                QuizApp.nextQuestion();
              });
            },
            child: Text(choice),
          ),
        ),
      );

  Widget _buildScore(choice) => Icon(
        choice == true ? Icons.check : Icons.close,
        color: choice == true ? Colors.green : Colors.red,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildQuestion(),
                ...QuizApp.getQuestionChoices().map((e) => _buildChoice(e)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      QuizApp.getScores().map((e) => _buildScore(e)).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
