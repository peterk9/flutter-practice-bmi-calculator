import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({@required this.height, @required this.weight});

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    _bmi = bmi;
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You havea higher than normal body weight. Try to excercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weguht. you can eat a bit more';
    }
  }
}
