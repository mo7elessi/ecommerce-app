part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class FetchHomeDataLoadingState extends HomeInitial {}

class FetchHomeDataLoadedState extends HomeInitial {
  final HomeModel homeModel;

  FetchHomeDataLoadedState({required this.homeModel});
}

class FetchHomeDataErrorState extends HomeInitial {
  final String error;
  FetchHomeDataErrorState({required this.error});
}

