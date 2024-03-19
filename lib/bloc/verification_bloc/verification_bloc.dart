import 'package:diplomversec/repository/verification_repository/model/user_model.dart';
import 'package:diplomversec/repository/verification_repository/verification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_state.dart';
part 'verification_event.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationRepository verificationRepository;

  VerificationBloc(this.verificationRepository) : super(UserInitialState()) {
    on<GetUserEvent>(_onUserVerificate);
  }

  Future<void> _onUserVerificate(
      GetUserEvent event, Emitter<VerificationState> emit) async {
    emit(UserLoadingState());

    try {
      final userInfo = await verificationRepository.verificate(event.token);
      if (userInfo != null) {
        emit(UserLoadedState(userInfo));
      } else {
        emit(UserErrorState('Verification failed'));
      }
    } catch (e) {
      emit(UserErrorState('error during verification'));
    }
  }
}
