import 'dart:collection';

import 'package:flutter/material.dart';

class ColorHistoryDrawer extends StatelessWidget {
  ColorHistoryDrawer({this.onColorSelection, this.colors});

  final Function(Color) onColorSelection;
  final Queue<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: colors.elementAt(index),
            child: ListTile(
              onTap: () {
                var _tappedColor = colors.elementAt(index);
                colors.remove(_tappedColor);
                onColorSelection(_tappedColor);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}