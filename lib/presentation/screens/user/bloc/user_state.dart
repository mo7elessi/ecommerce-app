part of 'user_bloc.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final String message;
  final bool status;

  UserSuccessState({required this.message, required this.status});
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}
