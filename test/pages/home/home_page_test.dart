import 'package:blog/bloc/home/home_page_bloc.dart';
import 'package:blog/data/repository/__mock__/post_repository_mock.dart';
import 'package:blog/data/repository/post_repository.dart';
import 'package:blog/pages/home/home_page.dart';
import 'package:blog/utils/key_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home Page', (WidgetTester tester) async {
    PostRepository repository = MockPostRepositoryImpl();
    HomePageBloc bloc = HomePageBloc(repository: repository);
    Widget testWidget = MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<HomePageBloc>(
          create: (context) => bloc,
          child: const HomePage(),
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    // Verify that our counter starts at 0.
    expect(find.byKey(KeyUtils.keySearchHomeWidget), findsOneWidget);
    expect(find.byKey(KeyUtils.keyBodyWidget), findsOneWidget);
  });
}
