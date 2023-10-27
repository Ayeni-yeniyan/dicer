import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.black, body: QuestionPage()),
    );
  }
}

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(flex: 5, child: Text('Are the questions displaying?')),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text('TRUE'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text('FALSE'),
            ),
          ),
        ],
      ),
    );
  }
}
