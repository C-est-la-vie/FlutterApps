import 'package:flutter/material.dart';
import 'package:simple_quiz_app/api/api_manager.dart';
import 'package:simple_quiz_app/model/quiz_model.dart';

enum QuizCategories { history, entertainment, mythology }

class AppManager extends ChangeNotifier {
  List<QuizModel>? _quizzes;
  List<bool> _scores = <bool>[];
  final APIManager apiManager = APIManager();
  bool _isAnswerVisible = false;

  int currentIndex = 0;
  int rightAnswers = 0;
  int wrongAnswers = 0;

  QuizModel? get currentQuestion => _quizzes?[currentIndex];

  List<bool> get scores => _scores;

  int get scoresLength => _scores.length;

  bool get isAnswerVisible => _isAnswerVisible;

  set isAnswerVisible(bool value) {
    _isAnswerVisible = value;
    notifyListeners();
  }

  List<String> getAnswers(int index) {
    final questions = _quizzes;
    if (questions != null) {
      final List<String> answers = List.from(questions[index].incorrectAnswers)
        ..add(questions[index].correctAnswer);
      answers.shuffle();
      return answers;
    } else {
      return <String>[];
    }
  }

  void checkAnswer({required String answer}) {
    if (_quizzes != null) {
      final quizAnswer = _quizzes![currentIndex].correctAnswer;
      if (quizAnswer == answer) {
        _scores.add(true);
        rightAnswers += 1;
      } else {
        _scores.add(false);
        wrongAnswers += 1;
      }
      _scores = List.from(_scores);

      notifyListeners();
    }
  }

  bool isLastQuestion() {
    final quizLength = (_quizzes?.length ?? 0) - 1;
    if (quizLength == currentIndex) {
      return true;
    } else {
      return false;
    }
  }

  void updateCurrentIndex() {
    final quizQuantity = _quizzes?.length;
    if (quizQuantity != null) {
      currentIndex =
          quizQuantity - 1 > currentIndex ? currentIndex + 1 : currentIndex;

      notifyListeners();
    }
  }

  void clearGame() {
    currentIndex = 0;
    rightAnswers = 0;
    wrongAnswers = 0;
    _quizzes = null;
    _scores.clear();
  }

  void loadQuestions(QuizCategories category) async {
    switch (category) {
      case QuizCategories.history:
        _quizzes = await apiManager.getHistoryQuestions();
        break;
      case QuizCategories.entertainment:
        _quizzes = await apiManager.getEntertainmentQuestions();
        break;
      case QuizCategories.mythology:
        _quizzes = await apiManager.getMythologyQuestions();
        break;
    }
    notifyListeners();
  }
}
