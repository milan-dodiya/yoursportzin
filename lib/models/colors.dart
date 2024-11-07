import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashColor extends ChangeNotifier {
  List<Color> backgroundGradientColors = [Colors.white, Colors.white];

  List<Color> get backGroundGradientColors => backgroundGradientColors;

  Color get textColor {
    // Check if purple is present in the gradient, change the text color to white
    if (backgroundGradientColors.contains(Color(0xFF9C7FD8),) ||backgroundGradientColors.contains(Color(0xFF321A6A),) ) {
      return Colors.white;
    } else {
      return Colors.black; // Default text color
    }
  }

  SplashColor() {
    GradiantTransition();
  }

  void GradiantTransition() {
    Timer(Duration(seconds: 1), () {
      backgroundGradientColors = [
        Color(0xFF9C7FD8), // Light purple
        Color(0xFF321A6A), //Dark purple
      ];
      notifyListeners();
    });
  }
}
