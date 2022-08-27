import 'package:blog/data/response/post.dart';
import 'package:blog/pages/home/component/item_post_widget.dart';
import 'package:blog/utils/key_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Item Post Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const item = Post(0, 0, 'title', 'body');

    Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
            home: Scaffold(
          body: ItemPostWidget(
            item: item,
            onClickItemPostWidget: (Post item) {},
          ),
        )));

    await tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.text(item.title ?? ''), findsOneWidget);

    await tester.tap(find.byKey(KeyUtils.keyItemPostWidget));
    await tester.pump();
  });
}
