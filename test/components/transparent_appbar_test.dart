import 'package:flutter/material.dart';
import 'package:flutter_task/components/contrasting_text.dart';
import 'package:flutter_task/components/paintable_canvas.dart';
import 'package:flutter_task/components/transparent_appbar.dart';
import 'package:flutter_task/utils/color_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("TransparentAppbar should be transparent (duh)", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TransparentAppbar(height: 56, buttonsColor: Colors.black,)));

    var appBarPredicate = (Widget widget) => widget is AppBar && widget.backgroundColor.alpha == 0;

    var appBarFinder = find.byWidgetPredicate(appBarPredicate);

    expect(appBarFinder, findsOneWidget);
  });

  testWidgets("TransparentAppbar should apply passed color to buttons", (WidgetTester tester) async {
    var expectedColor = Colors.black;

    await tester.pumpWidget(MaterialApp(home: TransparentAppbar(height: 56, buttonsColor: expectedColor,)));

    var iconPredicate = (Widget widget) => widget is Icon && widget.color == expectedColor;

    var iconFinder = find.byWidgetPredicate(iconPredicate);

    expect(iconFinder, findsOneWidget);
  });

  testWidgets("TransparentAppbar should apply passed height", (WidgetTester tester) async {
    var expectedHeight = 228.0;

    await tester.pumpWidget(MaterialApp(home: TransparentAppbar(height: expectedHeight, buttonsColor: Colors.red,)));

    var transparentAppbarPredicate = (Widget widget) => widget is TransparentAppbar && widget.preferredSize.height == expectedHeight;

    var transparentAppbarFinder = find.byWidgetPredicate(transparentAppbarPredicate);

    expect(transparentAppbarFinder, findsOneWidget);
  });
}
