// this can hold two type of questions MC, TF

import 'dart:io';

abstract class Question {
  String prompt;
  int point;

  Question(this.prompt, this.point);

  bool checkAnswer(String userInput);

  void display();
}

class MultipleChoice extends Question {
  List<String> options;
  String correctAnswer;

  MultipleChoice(super.prompt, super.point, this.options, this.correctAnswer);

  @override
  bool checkAnswer(String userInput) =>
      userInput.toLowerCase() == correctAnswer.toLowerCase();

  @override
  void display() {
    print('$prompt ($point pts)');
    for (var option in options) {
      print('  $option');
    }
  }
}

class TrueFalse extends Question {
  bool isTrue;

  TrueFalse(super.prompt, super.point, this.isTrue);

  @override
  bool checkAnswer(String userInput) {
    // True or False or T / F
    bool userBool =
        (userInput.toLowerCase() == 't' || userInput.toLowerCase() == 'true');
    return userBool == isTrue;
  }

  @override
  void display() {
    print('$prompt ($point pts)');
    print('  True');
    print('  False');
  }
}

class Quiz {
  List<Question> questions = [];

  int _score = 0;
  int _totalPossible = 0;

  int get currentScore => _score;

  void loadQuestions() {
    questions.add(
      MultipleChoice('What is the main programming language of flutter?', 10, [
        'Java',
        'Kotlin',
        'JavaScript',
        'Dart',
      ], 'Dart'),
    );

    questions.add(TrueFalse('Dart is a statically typed language.', 5, true));

    for (var q in questions) {
      _totalPossible += q.point;
    }
  }

  void start() {
    print('Welcome to OOP Quiz');

    for (var question in questions) {
      question.display();
      stdout.write('Your answer: ');
      String? input = stdin.readLineSync()?.trim();

      if (input != null && question.checkAnswer(input)) {
        print('Correct! +${question.point} points');
        _score += question.point;
      } else {
        print(
          'Incorrect! The correct answer was: ${question is MultipleChoice
              ? (question as MultipleChoice).correctAnswer
              : (question as TrueFalse).isTrue
              ? 'True'
              : 'False'}',
        );
      }
    }

    print('\nQuiz Completed! Your final score: $_score/$_totalPossible');
  }
}

void main() {
  Quiz quiz = Quiz();
  quiz.loadQuestions();
  quiz.start();
}
