import 'dart:math';

import 'package:flutter/material.dart';

class BMIBrain {
  final int height;
  final int weight;
  double bmi = 0;

  BMIBrain({
    @required this.height,
    @required this.weight,
  }) {
    bmi = weight / pow(height / 100, 2);
  }

  String getResult() {
    if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi < 25) {
      return 'NORMAL';
    } else if (bmi < 30) {
      return 'OVERWEIGHT';
    } else {
      return 'Ohhhh!';
    }
  }

  String getBMI() {
    return bmi.toStringAsFixed(2);
  }

  String getInterpretation() {
    if (bmi < 18.5) {
      return 'You are dying, eat somthing';
    } else if (bmi < 25) {
      return 'You are good to go';
    } else if (bmi < 30) {
      return 'You are fat, Excersice more';
    } else {
      return 'You are exploding!';
    }
  }
}
