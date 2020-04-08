import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 4},
          {'text': 'Blue', 'score': 3},
          {'text': 'Red', 'score': 2},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Snake', 'score': 4},
          {'text': 'Chameleon', 'score': 3},
          {'text': 'Dog', 'score': 2},
          {'text': 'Bird', 'score': 1}
        ]
      },
      {
        'questionText': 'Who\'s the best developer?',
        'answers': [
          {'text': 'Sergio Romero', 'score': 1},
          {'text': 'Sergio Romero', 'score': 1},
          {'text': 'Sergio Romero', 'score': 1},
          {'text': 'Sergio Romero', 'score': 1}
        ]
      }
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Simple Quiz'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, resetQuiz)),
    );
  }
}
