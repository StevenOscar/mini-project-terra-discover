import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:terra_discover_project/screens/pull_tracker/pull_tracker_screen.dart';

void main() {
  testWidgets('Title di appbar harus berjudul Pull Tracker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PullTrackerInitScreen()
    ));

    expect(find.widgetWithText(AppBar,'Pull Tracker'), findsOneWidget);
  });

  testWidgets('Menampilkan drawer ketika icon ditekan/slide', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PullTrackerInitScreen()
    ));

    expect(find.byType(Drawer), findsNothing);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    expect(find.byType(Drawer), findsOneWidget);
  });
}