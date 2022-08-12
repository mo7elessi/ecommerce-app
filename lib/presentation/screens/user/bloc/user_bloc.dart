import 'package:bloc/bloc.dart';
import 'package:bloc_state_managment/data/model/user_model.dart';
import 'package:bloc_state_managment/data/repositories/user_repository.dart';

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
    try {
      UserData userData = event.userData;
      var data = await userRepository.createUser(userModel: userData);
      emit(UserSuccessState(data.message!,data.status!));
    } catch (e) {
      emit(UserErrorState("$e"));
    }
  }

  Future<void> _onLogin(
      LoginEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(UserLoadingState());
    try {
      var data = await userRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(UserSuccessState(data.message!,data.status!));
    } catch (e) {
      emit(UserErrorState("$e"));
    }
  }

  Future<void> _onVerifyEmail(
      VerifyEmailEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(UserLoadingState());
    try {
      var data = await userRepository.verifyEmail(email: event.email);
      emit(UserSuccessState(data.message!,data.status!));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onVerifyCode(
      VerifyCodeEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(UserLoadingState());
    try {
      var data = await userRepository.verifyCode(
        email: event.email,
        code: event.code,
      );
      emit(UserSuccessState(data.message!,data.status!));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> _onResetPassword(
      ResetPasswordEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(UserLoadingState());
    try {
      var data = await userRepository.resetPassword(
        email: event.email,
        code: event.code,
        password: event.password,
      );
      emit(UserSuccessState(data.message!,data.status!));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
