import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/user_model.dart';
import 'package:bloc_state_managment/data/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

part 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository = UserRepository();

  UserBloc() : super(UserInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<VerifyEmailEvent>(_onVerifyEmail);
    on<VerifyCodeEvent>(_onVerifyCode);
    on<ResetPasswordEvent>(_onResetPassword);
  }

  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    UserModel userData = event.userData;
    var failureOrSuccess = await userRepository.createUser(userModel: userData);
    _mapFailureOrSuccessToState(either: failureOrSuccess);
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    var failureOrSuccess = await userRepository.login(
      email: event.email,
      password: event.password,
    );
    _mapFailureOrSuccessToState(either: failureOrSuccess);
  }

  Future<void> _onVerifyEmail(
    VerifyEmailEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    var failureOrSuccess = await userRepository.verifyEmail(email: event.email);
    _mapFailureOrSuccessToState(either: failureOrSuccess);
  }

  Future<void> _onVerifyCode(
    VerifyCodeEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    var failureOrSuccess = await userRepository.verifyCode(
      email: event.email,
      code: event.code,
    );
    _mapFailureOrSuccessToState(either: failureOrSuccess);
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    var failureOrSuccess = await userRepository.resetPassword(
      email: event.email,
      code: event.code,
      password: event.password,
    );
    _mapFailureOrSuccessToState(either: failureOrSuccess);
  }

  UserState _mapFailureOrSuccessToState({
    required Either<Failure, UserResponse> either,
  }) {
    return either.fold(
      (failure) => UserErrorState(message: '${failure.runtimeType}'),
      (data) => UserSuccessState(message: data.message!, status: data.status!),
    );
  }
}
