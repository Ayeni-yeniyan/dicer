import 'dart:math';

import 'package:flutter/material.dart';

class CalculateBMI {
  CalculateBMI({required this.weight, required this.height});
  final int weight;
  final int height;
  late double _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  Text range() {
    if (_bmi < 18.1) {
      return const Text(
        'UNDERWEIGHT',
        style: TextStyle(fontSize: 20, color: Colors.yellow),
      );
    } else if (_bmi <= 25) {
      return const Text(
        'NORMAL',
        style: TextStyle(fontSize: 20, color: Colors.green),
      );
    } else {
      return const Text(
        'OVERWEIGHT',
        style: TextStyle(fontSize: 20, color: Colors.red),
      );
    }
  }

  String interpretation() {
    if (_bmi < 18) {
      return 'OMOOO. You are underweight o. Try to eat more!';
    } else if (_bmi <= 25) {
      return 'You have a normal body weight, my gee. Good job!';
    } else {
      return 'OOPS! You are overweight, guy. Try to exercise more!';
    }
  }
}
