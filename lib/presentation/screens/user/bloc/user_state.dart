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

// //register
// class RegisterLoadingState extends UserState {}
//
// class RegisterSuccessState extends UserState {
//   final String message;
//   final bool status;
//
//   RegisterSuccessState(this.message, this.status);
// }
//
// class RegisterErrorState extends UserState {
//   final String message;
//
//   RegisterErrorState(this.message);
// }
//
// //login
// class LoginLoadingState extends UserState {}
//
// class LoginSuccessState extends UserState {
//   final String message;
//   final bool status;
//
//   LoginSuccessState(this.message, this.status);
// }
//
// class LoginErrorState extends UserState {
//   final String message;
//
//   LoginErrorState(this.message);
// }
//
// //verify email
// class VerifyEmailLoadingState extends UserState {}
//
// class VerifyEmailSuccessState extends UserState {
//   final String message;
//
//   VerifyEmailSuccessState(this.message);
// }
//
// class VerifyEmailErrorState extends UserState {
//   final String message;
//
//   VerifyEmailErrorState(this.message);
// }
//
// //verify code
// class VerifyCodeLoadingState extends UserState {}
//
// class VerifyCodeSuccessState extends UserState {
//   final String message;
//
//   VerifyCodeSuccessState(this.message);
// }
//
// class VerifyCodeErrorState extends UserState {
//   final String message;
//
//   VerifyCodeErrorState(this.message);
// }
//
// //reset password
// class ResetPasswordLoadingState extends UserState {}
//
// class ResetPasswordSuccessState extends UserState {
//   final String message;
//
//   ResetPasswordSuccessState(this.message);
// }
//
// class ResetPasswordErrorState extends UserState {
//   final String message;
//
//   ResetPasswordErrorState(this.message);
// }
