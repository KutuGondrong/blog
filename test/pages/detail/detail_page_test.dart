import 'package:blog/args/detail_page_args.dart';
import 'package:blog/data/response/post.dart';
import 'package:blog/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Detail Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    DetailPageArgs args = DetailPageArgs(const Post(0, 0, 'title', 'body'));

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(home: DetailPage(args: args))
    );

    await
    tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.text(args.data.title ?? ''), findsOneWidget);
    expect(find.text(args.data.body ?? ''), findsOneWidget);
  });
}
