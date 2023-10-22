import 'package:flutter/material.dart';
import 'package:flutter_task_ui_testing/screen/counter_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing Counter Screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CounterScreen(),
    ));

    expect(find.text('Counter App'), findsOneWidget);
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.widgetWithText(ElevatedButton, "Increment"));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, "Decrement"));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('0'), findsOneWidget);
  });
}
