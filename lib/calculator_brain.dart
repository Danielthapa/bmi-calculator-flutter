import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Excercise more. Maintain your diet';
    } else if (_bmi > 18.5) {
      return 'Good Job. keep it up';
    } else {
      return 'Eat more. Increase your weight';
    }
  }
}
