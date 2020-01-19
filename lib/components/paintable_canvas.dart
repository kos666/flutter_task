import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/components/contrasting_text.dart';

//todo come up with a more descriptive name
class PaintableCanvas extends StatelessWidget {
  PaintableCanvas({this.color, this.onTap});

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Stack(
        children: <Widget>[
          Center(
            child: ContrastingText(
              color: color,
            ),
          ),
          GestureDetector(
            onTap: onTap,
          )
        ],
      ),
    );
  }
}