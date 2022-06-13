import 'dart:math';

class CalculateBMI {
  static double Calculate(double height, double weight) {
    return weight / pow(height * 0.01, 2);
  }

  static String getInterpretation(int bmi) {
    if (bmi >= 25) {
      return 'You are higher than normal body weight . Try to exercise more';
    } else if (bmi >= 18.5) {
      return "You have normal body weight . Good job !";
    } else {
      return "You have a lower than normal body weight . You can eat a bit more .";
    }
  }
}
