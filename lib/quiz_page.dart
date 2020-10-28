import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz.dart';

final quizApp = Quiz();

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Widget _buildQuestion() => Expanded(
        flex: 5,
        child: Center(
          child: Text(
            quizApp.getQuestion(),
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
                quizApp.addScore(choice);
                if (quizApp.isFinished()) {
                  showGameFinishedDialog(context, quizApp.getScore());
                  quizApp.reset();
                } else {
                  quizApp.nextQuestion();
                }
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildQuestion(),
        ...quizApp.getQuestionChoices().map((e) => _buildChoice(e)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: quizApp.getScores().map((e) => _buildScore(e)).toList(),
        )
      ],
    );
  }
}

void showGameFinishedDialog(context, score) => Alert(
      context: context,
      type: AlertType.success,
      title: 'FINISHED',
      desc: 'Your score is $score',
      buttons: [
        DialogButton(
          child: Text(
            'Play Again',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
