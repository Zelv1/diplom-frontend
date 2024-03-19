part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class UserInitialState extends VerificationState {}

class UserLoadingState extends VerificationState {}

class UserLoadedState extends VerificationState {
  final UserModel user;

  UserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserErrorState extends VerificationState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}
