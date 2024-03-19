part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object?> get props => [];
}

class GetUserEvent extends VerificationEvent {
  final String token;

  GetUserEvent({required this.token});

  @override
  List<Object> get props => [token];
}
