import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

// void main(){
//   runApp(MyApp());
// }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What is Mudra\'s favourite color?',
      'answers': [
        {'text':'Blue', 'score': 10},
        {'text':'Red', 'score':0},
        {'text':'Green', 'score':0},
        {'text': 'White', 'score': 0}
      ],
    },
    {
      'questionText': 'What is Mudra\'s favourite animal?',
      'answers': [
        {'text':'Rabbit', 'score':0},
        {'text':'Leopard','score':0},
        {'text':'Lion', 'score':10},
        {'text':'Elephant', 'score':0}],
    },
    {
      'questionText': 'Who is Mudra\'s favourite instructor?',
      'answers': [
        {'text':'Max', 'score': 10},
        {'text':'Angela','score':0},
        {'text':'Pawan', 'score':0},
        {'text':'Andrew','score':0}],
    },
  ];

  void resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Center(
          child:
        _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
      ),
    );
  }
}
