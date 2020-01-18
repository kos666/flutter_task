import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  var _random = Random();

  Color adaptColor(Color color) {
    var luminance = color.computeLuminance();
    print("r: ${color.red}, g: ${color.green}, b: ${color.blue}, lum: ${luminance}, res: ${luminance > 0.5}");

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