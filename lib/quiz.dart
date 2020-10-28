import 'questions_data.dart';

class Quiz {
  List<Map<String, Object>> _questionBank = questionsData;
  List<bool> _scores = [];
  int _questionNum = 0;

  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) _questionNum++;
  }

  String getQuestion() => _questionBank[_questionNum]["question"];

  int getQuestionAnswer() => _questionBank[_questionNum]["answer"];

  List<String> getQuestionChoices() => _questionBank[_questionNum]["choices"];

  void addScore(String userChoice) {
    _scores
        .add(getQuestionAnswer() == getQuestionChoices().indexOf(userChoice));
  }

  List<bool> getScores() => _scores;
}
