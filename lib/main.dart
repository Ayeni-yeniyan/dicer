import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color background = Colors.red.shade900;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: background,
            centerTitle: true,
            title: Text('DICER!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          body: DicePage()),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 2;
  int rightDiceNumber = 4;
  void diceNumber() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(16)),
            onPressed: () {
              diceNumber();
            },
            child: Image.asset('assets/images/dice$leftDiceNumber.png'),
          )),
          Expanded(
              child: TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(16)),
            onPressed: () {
              diceNumber();
            },
            child: Image.asset('assets/images/dice$rightDiceNumber.png'),
          ))
        ],
      ),
    );
  }
}
