import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_bank.dart';

QuizBrain _quizBrain = QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: QuestionPage(),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    void checkAnswer(bool userAnswer) {
      bool correctAnswer = _quizBrain.getAnswer();
      setState(() {
        if (_quizBrain.isFinished()) {
          Alert(
            context: context,
            title: 'YAY!!',
            desc: 'You\'re all done with the quiz!',
          ).show();

          _quizBrain.restartQuiz(scoreKeeper);
        } else if (correctAnswer == userAnswer) {
          scoreKeeper.add(Icon(
            Icons.check_box,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.cancel,
            color: Colors.red,
          ));
        }
        _quizBrain.nextQuestion();
      });
    }

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            child: Center(
              child: Text(
                _quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: TextButton(
                onPressed: () => checkAnswer(true),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text('TRUE'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: TextButton(
                onPressed: () => checkAnswer(false),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('FALSE'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
              children: scoreKeeper,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly),
        )
      ],
    );
  }
}
