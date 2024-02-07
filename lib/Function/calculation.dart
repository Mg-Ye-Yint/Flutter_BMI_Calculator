import 'package:flutter/material.dart';
import 'dart:math';

class calculatorbrain {
  calculatorbrain({required this.weight, required this.height});

  final int weight;
  final int height;

  late double _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getstatus() {
    if (_bmi <= 18.4) {
      return 'Underweight';
    } else if (18.5 <= _bmi && _bmi <= 24) {
      return 'Normal';
    } else if (25 <= _bmi && _bmi <= 29) {
      return 'Overweight';
    } else if (_bmi >= 30) {
      return 'Obese';
    } else {
      return 'Unknown';
    }
  }

  getfeedback() {
    if (getstatus() == 'Underweight') {
      return 'You are slightly underweight. You should try gaining some weight.';
    } else if (getstatus() == 'Normal') {
      return 'You body is perfect. Try maintain it.';
    } else if (getstatus() == 'Overweight') {
      return 'You are overweight. You should consider about weight lost.';
    } else if (getstatus() == 'Obese') {
      return 'You are obese. You should workout and diet right now.';
    }
  }
}
