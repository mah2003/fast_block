import 'package:bloc/bloc.dart';
import 'package:fast_block/core/services/local_storage/local_storage.dart';
import 'package:fast_block/feature/auth/data/repo/Auth_repo.dart';
import 'package:fast_block/feature/auth/presentaion/bloc/auth_event.dart';
import 'package:fast_block/feature/auth/presentaion/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepo.login(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(LoginSuccessState());
      } else {
        emit(AuthErrorState("Login Failed"));
      }
    });
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    await AuthRepo.register(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(RegisterSuccessState());
      } else {
        emit(AuthErrorState("Register Failed"));
      }
    });
  }
}
