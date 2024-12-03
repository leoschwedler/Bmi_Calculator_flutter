class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi = 0;

  CalculatorBrain({required this.weight, required this.height});

  String calculateBMI() {
    _bmi = weight / (height / 100 * height / 100);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 28.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 28.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more";
    }
  }
}
