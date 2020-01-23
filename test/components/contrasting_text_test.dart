import 'package:flutter/material.dart';
import 'package:flutter_task/components/contrasting_text.dart';
import 'package:flutter_test/flutter_test.dart';

_testColor(WidgetTester tester, Color backgroundColor, Color expectedColor, String reason) async {
  final brightColor = backgroundColor;

  await tester.pumpWidget(MaterialApp(home: ContrastingText(color: brightColor, data: "test")));

  var textPredicate = (Widget widget) => widget is Text && widget.style.color == expectedColor;

  var textFinder = find.byWidgetPredicate(textPredicate);

  expect(textFinder, findsOneWidget, reason: reason);
}

void main() {
  testWidgets("ContrastingText should contain black text when passed color with luminance > 0.5", (WidgetTester tester) async {
    //luminance 0.5272439219480779
    await _testColor(tester, Color(0x9c3dd993), Colors.black, "contrasting text with bright passed color should have one black text in tee");
  });

  testWidgets("ContrastingText should contain white text when passed color with luminance < 0.5", (WidgetTester tester) async {
    //luminance  0.44347056295419063
    await _testColor(tester, Color(0xc243c979), Colors.white, "contrasting text with dark passed color should have one white text in tee");
  });

  testWidgets("ContrastingText should contain text with passed data", (WidgetTester tester) async {
    var expectedText = "This text is actually an easter egg, have a nice day";

    await tester.pumpWidget(MaterialApp(home: ContrastingText(color: Colors.green, data: expectedText)));

    var textPredicate = (Widget widget) => widget is Text && widget.data == expectedText;

    var textFinder = find.byWidgetPredicate(textPredicate);

    expect(textFinder, findsOneWidget);
  });
}
