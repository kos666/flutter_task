import 'package:flutter/cupertino.dart';
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
          color: _colorUtils.adaptColor(color)
        //todo use a font that isn't boring
      ),
    );
  }
}