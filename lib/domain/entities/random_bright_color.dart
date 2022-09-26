import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

//TODO: implement HSV color generator that doesn't generates two similar colors
class RandomBrightColor {
  Color generate() {
    var color69 = Random()
        .nextInt(3); // Choose which field (R, G, or B) will have the 69 value
    var color222 = Random()
        .nextBool(); // Choose which field the 2 fields that are left (the first or the second) will have the 222 value
    var colorVal = 69 +
        Random().nextInt(153); // Choose tha random value for the last field

    Color finalColor;

    if (color69 == 0) {
      if (color222) {
        finalColor = Color.fromRGBO(69, 222, colorVal, 1);
      } else {
        finalColor = Color.fromRGBO(69, colorVal, 222, 1);
      }
    } else if (color69 == 1) {
      if (color222) {
        finalColor = Color.fromRGBO(222, 69, colorVal, 1);
      } else {
        finalColor = Color.fromRGBO(colorVal, 69, 222, 1);
      }
    } else {
      if (color222) {
        finalColor = Color.fromRGBO(222, colorVal, 69, 1);
      } else {
        finalColor = Color.fromRGBO(colorVal, 222, 69, 1);
      }
    }

    return finalColor;
  }
}
