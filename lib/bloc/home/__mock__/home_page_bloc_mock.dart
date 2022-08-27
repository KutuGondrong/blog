import 'package:blog/bloc/home/home_page_bloc.dart';
import 'package:blog/bloc/home/home_page_event.dart';
import 'package:blog/bloc/home/home_page_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockHomePageBloc
    extends MockBloc<HomePageEvent, HomePageState>
    implements HomePageBloc {}

class HomePageStateFake extends Fake implements HomePageState {}

class HomePageEventFake extends Fake implements HomePageEvent {}