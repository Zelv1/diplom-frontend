import 'package:diplomversec/repository/auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<AuthLoginEvent>(_onAuthLogin);
  }

  Future<void> _onAuthLogin(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final token =
          await authRepository.authenticate(event.username, event.password);
      if (token != null) {
        emit(AuthAuthenticatedState(token: token));
      } else {
        emit(AuthErrorState(errorMessage: 'Authentication failed'));
      }
    } catch (e) {
      emit(AuthErrorState(errorMessage: 'Error during authentication'));
    }
  }
}
