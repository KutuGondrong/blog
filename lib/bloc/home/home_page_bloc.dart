import 'package:blog/bloc/home/home_page_event.dart';
import 'package:blog/bloc/home/home_page_state.dart';
import 'package:blog/data/repository/post_repository.dart';
import 'package:blog/data/response/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final PostRepository repository;
  List<Post> originalPost = [];

  HomePageBloc({required this.repository}) : super(InitialHomePageState());

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LoadPostHomePageEvent) {
      try {
        yield state.loading();

        final List<Post> response = await repository.getListPost() ?? [];
        originalPost = response;
        yield state.success(response);
      } catch (e) {
        yield state.error(errorMessage: e.toString());
      }
    } else if (event is SearchPostHomePageEvent) {
      try {
        yield state.loading();
        if (event.search.isEmpty) {
          yield state.success(originalPost);
        } else {
          final List<Post> dataSearch = originalPost
              .where(
                  (element) => element.title?.contains(event.search) ?? false)
              .toList();
          yield state.success(dataSearch);
        }
      } catch (e) {
        yield state.success(originalPost);
      }
    }
  }
}
