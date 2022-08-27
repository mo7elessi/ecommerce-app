part of 'user_bloc.dart';
abstract class UserEvent {
  const UserEvent();
}

class RegisterEvent extends UserEvent {
  final UserModel userData;

  RegisterEvent(this.userData);
}

class LoginEvent extends UserEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class VerifyEmailEvent extends UserEvent {
  final String email;

  VerifyEmailEvent({required this.email});
}

class VerifyCodeEvent extends UserEvent {
  final String email;
  final String code;

  VerifyCodeEvent({required this.email, required this.code});
}

class ResetPasswordEvent extends UserEvent {
  final String email;
  final String code;
  final String password;

  ResetPasswordEvent({
    required this.email,
    required this.code,
    required this.password,
  });
}
