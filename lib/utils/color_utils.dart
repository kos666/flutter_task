import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  var _random = Random();

  Color getContrastColor(Color color) {
    var luminance = color.computeLuminance();

    // logically luminance should be compared to 0.5
    // but that sometimes leads to text not being visible,
    // not sure if it's just my eyes shenanigans
    return luminance > 0.8 ? Colors.black : Colors.white;
  }

  Color getRandomColor() {
    return Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256), 255
    );
  }
}