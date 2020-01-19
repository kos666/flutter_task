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

  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
  }

  @override
  Widget build(BuildContext context) {
    var _mainColor = _animation?.value != null ? _animation.value : Colors.green;
    var _contrastColor = _colorUtils.getContrastColor(_mainColor);
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: TransparentAppbar(
              height: 150,
              buttonsColor: _contrastColor,
            ),
            body: PaintableCanvas(
              color: _mainColor,
              onTap: _changeColor,
            ),
            drawer: Drawer(

            ),
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
          setState(() {});
        });

      _backgroundColor = newColor;
      _controller.forward(from: 0);
    });
  }
}