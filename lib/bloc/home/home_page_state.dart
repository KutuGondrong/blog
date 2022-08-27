import 'package:blog/data/response/post.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  final List<Post> listPost;

  const HomePageState({this.listPost = const []});

  LoadingHomePageState loading() {
    return LoadingHomePageState(listPost);
  }

  ErrorHomePageState error({String errorMessage = "Unknown Error"}) {
    return ErrorHomePageState(listPost, errorMessage: errorMessage);
  }

  SuccessHomePageState success(List<Post> listPost) {
    return SuccessHomePageState(listPost);
  }

  @override
  List<Object> get props => [listPost];
}

class InitialHomePageState extends HomePageState {}

class LoadingHomePageState extends HomePageState {
  const LoadingHomePageState(List<Post> listPost) : super(listPost: listPost);
}

class ErrorHomePageState extends HomePageState {
  final String errorMessage;

  const ErrorHomePageState(List<Post> listPost,
      {this.errorMessage = "Unknown Error"})
      : super(listPost: listPost);

  @override
  String toString() => 'Error : $errorMessage';
}

class SuccessHomePageState extends HomePageState {
  const SuccessHomePageState(List<Post> listPost) : super(listPost: listPost);
}
