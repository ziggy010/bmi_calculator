import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;

  CalculatorBrain({required this.height, required this.weight});

  late double _bmi;

  double calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getStatus() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 17.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getSuggestion() {
    if (_bmi >= 25) {
      return 'Your weight is more than average, start doing some exercise.';
    } else if (_bmi >= 17.5) {
      return 'Your weight is normal, Good job!';
    } else {
      return 'Your weight is less than average, start to eat some proteins.';
    }
  }
}
