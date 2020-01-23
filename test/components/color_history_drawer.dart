import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_task/components/color_history_drawer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("ColorHistoryDrawer should call onColorSelection on tap and pass tapped color to it", (WidgetTester tester) async {
    final expectedColor = Colors.redAccent;
    final Queue<Color> colors = Queue.from([Colors.greenAccent, expectedColor, Colors.pinkAccent]);

    var tappedColor;

    await tester.pumpWidget(MaterialApp(
      home: ColorHistoryDrawer(
        onColorSelection: (color) {
          tappedColor = color;
        },
        colors: colors,
      ),
    )
    );

    var containerPredicate = (Widget widget) => widget is Container
        && (widget.decoration as BoxDecoration).color == expectedColor;

    await tester.tap(find.byWidgetPredicate(containerPredicate));

    expect(tappedColor, expectedColor, reason: "callback wasn't called");
  });
}