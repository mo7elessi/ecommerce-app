part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class FetchHomeDataLoadingState extends HomeInitial {}

class FetchHomeDataLoadedState extends HomeInitial {
  final HomeModel homeModel;

  FetchHomeDataLoadedState(this.homeModel);
}

class FetchHomeDataErrorState extends HomeInitial {
  final String error;
  FetchHomeDataErrorState(this.error);
}

