import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/utils/color_utils.dart';

class ContrastingText extends StatelessWidget {
  ContrastingText({this.color});

  final Color color;
  final ColorUtils _colorUtils = ColorUtils();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hey there",
      style: TextStyle(
          fontSize: 48,
          color: _colorUtils.getContrastColor(color),
          shadows: [
            Shadow(
                color: Colors.blueGrey,
                blurRadius: 30
            )
          ]
        //todo use a font that isn't boring
      ),
    );
  }
}