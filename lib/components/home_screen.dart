import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_task/components/color_history_drawer.dart';
import 'package:flutter_task/components/paintable_canvas.dart';
import 'package:flutter_task/components/transparent_appbar.dart';
import 'package:flutter_task/utils/color_utils.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  var _colorUtils = ColorUtils();

  Queue<Color> _pastColors = Queue.from([Colors.green]);

  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mainColor = _animation?.value != null ? _animation.value : Colors.green;
    var _contrastColor = _colorUtils.getContrastColor(_mainColor);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppbar(
        height: 56,
        buttonsColor: _contrastColor,
      ),
      // keep AnimatedBuilder in the body instead of root to avoid rebuilding
      // the whole tree every frame of animation
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return PaintableCanvas(
              color: _mainColor,
              onTap: () {
                _changeColor(_colorUtils.getRandomColor());
              },
            );
          }
      ),
      drawer: ColorHistoryDrawer(colors: _pastColors, onColorSelection: _changeColor,)
    );
  }

  void _changeColor(Color newColor) {
    setState(() {
      _animation = ColorTween(begin: _pastColors.last, end: newColor)
          .animate(_controller);

      _pastColors.addFirst(newColor);
      _controller.forward(from: 0);
    });
  }
}