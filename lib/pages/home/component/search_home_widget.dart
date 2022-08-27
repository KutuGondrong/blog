import 'package:blog/bloc/home/home_page_bloc.dart';
import 'package:blog/bloc/home/home_page_event.dart';
import 'package:blog/bloc/home/home_page_state.dart';
import 'package:blog/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return SearchWidget(
        loading: state is LoadingHomePageState,
        onTextChange: (search) {
          context.read<HomePageBloc>().add(SearchPostHomePageEvent(search));
        },
      );
    });
  }
}
