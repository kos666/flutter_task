import 'package:flutter/material.dart';
import 'package:flutter_task/components/contrasting_text.dart';
import 'package:flutter_task/components/paintable_canvas.dart';
import 'package:flutter_task/utils/color_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("paintable canvas should contain colored Material and ContrastingText", (WidgetTester tester) async {
    final expectedColor = ColorUtils().getRandomColor();

    await tester.pumpWidget(MaterialApp(home: PaintableCanvas(color: expectedColor,)));

    var materialPredicate = (Widget widget) => widget is Material && widget.color == expectedColor;
    var contrastingTextPredicate = (Widget widget) => widget is ContrastingText && widget.data == "Hey there";

    var materialFinder = find.byWidgetPredicate(materialPredicate);
    var contrastingTextFinder = find.byWidgetPredicate(contrastingTextPredicate);

    expect(materialFinder, findsOneWidget, reason: "home screen should have one Material widget in tree");
    expect(contrastingTextFinder, findsOneWidget, reason: "home screen should have one ContrastingText widget in tree");
  });

  testWidgets("paintable canvas should call onTap callback", (WidgetTester tester) async {
    final expectedColor = ColorUtils().getRandomColor();

    var isTapped = false;

    var widget = MaterialApp(
        home: PaintableCanvas(
          color: expectedColor,
          onTap: () {isTapped = true;},
        )
    );

    await tester.pumpWidget(widget);

    await tester.tap(find.byWidget(widget));

    expect(isTapped, true, reason: "callback wasn't called");
  });
}
