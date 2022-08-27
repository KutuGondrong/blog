import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPostHomePageEvent extends HomePageEvent {
  LoadPostHomePageEvent();

  @override
  List<Object> get props => [];
}

class SearchPostHomePageEvent extends HomePageEvent {
  final String search;

  SearchPostHomePageEvent(this.search);

  @override
  List<Object> get props => [search];
}
