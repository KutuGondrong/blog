import 'package:blog/args/detail_page_args.dart';
import 'package:blog/bloc/home/home_page_bloc.dart';
import 'package:blog/bloc/home/home_page_state.dart';
import 'package:blog/pages/home/component/item_post_widget.dart';
import 'package:blog/route.dart';
import 'package:blog/utils/const_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        return;
      },
      builder: (context, state) {
        if (state is InitialHomePageState || state is LoadingHomePageState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorHomePageState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is SuccessHomePageState) {
          return ListView.separated(
              itemBuilder: (_, index) {
                return ItemPostWidget(
                  item: state.listPost[index],
                  onClickItemPostWidget: (item) {
                    Navigator.pushNamed(context, Routes.detail,
                        arguments: DetailPageArgs(item));
                  },
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 3,
                );
              },
              itemCount: state.listPost.length);
        }
        return const Center(
          child: Text(ConstString.error),
        );
      },
    );
  }
}
