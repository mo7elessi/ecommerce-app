part of 'user_bloc.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {}

//test
class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final String message;
  final bool status;

  UserSuccessState(this.message, this.status);
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState(this.message);
}
