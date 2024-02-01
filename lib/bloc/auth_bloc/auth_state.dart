part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final String token;

  AuthAuthenticatedState({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
