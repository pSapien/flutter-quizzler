import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const questions = [
  {'question': 'Question A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
  {'question': 'A', 'answer': true},
];

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentQuestionIdx = 0;
  List<bool> _answers = [];

  Widget _buildButton(color, text, onPress) {
    return ListTile(
      title: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        color: color,
        child: Text(text, style: TextStyle(fontSize: 20)),
        onPressed: onPress,
      ),
    );
  }

  Widget _buildQuestion() {
    final currentQuestion = questions[_currentQuestionIdx];

    void checkAnswer(userAnswer) {
      final questionAnswer = currentQuestion['answer'];

      setState(() {
        final currAnswer = questionAnswer == userAnswer;
        _answers.add(currAnswer);
      });
    }

    return Column(
      children: [
        Text(currentQuestion['question']),
        _buildButton(Colors.green, 'YES', () => checkAnswer(true)),
        _buildButton(Colors.red, 'NO', () => checkAnswer(false)),
      ],
    );
  }

  Widget _buildScoreKeeper() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children:
          _answers.map((answer) => Text(answer == true ? 'T' : 'F')).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.teal,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildQuestion(),
            _buildScoreKeeper(),
          ],
        ),
      ),
    );
  }
}
