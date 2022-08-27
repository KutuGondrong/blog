import 'package:blog/args/detail_page_args.dart';
import 'package:blog/bloc/home/home_page_bloc.dart';
import 'package:blog/bloc/home/home_page_event.dart';
import 'package:blog/data/repository/post_repository_impl.dart';
import 'package:blog/pages/detail/detail_page.dart';
import 'package:blog/pages/home/home_page.dart';
import 'package:blog/route.dart';
import 'package:blog/utils/const_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(repository: PostRepositoryImpl())
            ..add(LoadPostHomePageEvent()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ConstString.title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: Routes.home,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Routes.home:
                {
                  return MaterialPageRoute(builder: (_) => const HomePage());
                }
              case Routes.detail:
                {
                  final DetailPageArgs args =
                      settings.arguments as DetailPageArgs;
                  return MaterialPageRoute(
                      builder: (_) => DetailPage(args: args));
                }
              default:
                {
                  assert(false, 'Need to implement ${settings.name}');
                  return null;
                }
            }
          }),
    );
  }
}
