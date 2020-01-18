import 'package:flutter/material.dart';
import 'package:solid_software_task/components/paintable_canvas.dart';
import 'package:solid_software_task/components/transparent_appbar.dart';
import 'package:solid_software_task/utils/ColorUtils.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

//todo come up with a more descriptive name
class _HomeScreenState extends State<HomeScreen> {
  var _colorUtils = ColorUtils();
  Color _backgroundColor = Colors.green;

  void _changeColor() {
    setState(() {
      _backgroundColor = _colorUtils.getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PaintableCanvas(
            color: _backgroundColor
        ),
        TransparentAppbar(
          buttonsColor: _colorUtils.adaptColor(_backgroundColor),
        ),
        GestureDetector(
          onTap: _changeColor,
        ),
      ],
    );
  }
}