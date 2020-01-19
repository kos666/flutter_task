import 'package:flutter/material.dart';
import 'package:flutter_task/components/paintable_canvas.dart';
import 'package:flutter_task/components/transparent_appbar.dart';
import 'package:flutter_task/utils/color_utils.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  var _colorUtils = ColorUtils();

  Color _backgroundColor = Colors.green;
  Color _nextColor;

  AnimationController _controller;

  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();

    _nextColor = _colorUtils.getRandomColor();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animation = ColorTween(begin: _backgroundColor, end: _nextColor)
        .animate(_controller)
      ..addListener(() {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              PaintableCanvas(
                color: _animation.value,
              ),
              TransparentAppbar(
                buttonsColor: _colorUtils.adaptColor(_animation.value),
              ),
              GestureDetector(
                onTap: _changeColor,
              ),
            ],
          );
        }
    );
  }

  void _changeColor() {
    setState(() {
      var newColor = _colorUtils.getRandomColor();

      _animation = ColorTween(begin: _backgroundColor, end: newColor)
          .animate(_controller)
        ..addListener(() {
          setState(() {

          });
        });

      _backgroundColor = newColor;
      _controller.forward(from: 0);
    });
  }
}