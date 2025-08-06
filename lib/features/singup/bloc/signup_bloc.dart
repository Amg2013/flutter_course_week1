import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_project/features/auth/bloc/login_bloc.dart';
import 'package:iti_project/features/singup/models/Auth_repo.dart';
import 'package:iti_project/utils/form_validator.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo _authRepo;

  SignUpBloc(this._authRepo) : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    //
    on<SignUpReset>(_onSignUpReset);
    //
    on<InitiSingUpScreenEvent>(_onSignUpIniti);
  }

  // SignUpValidator signUpValidator;
  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    await Future.delayed(const Duration(seconds: 2));
    // Simulate success/failure

    try {
      ///email.  texte >>>emil event >>> emil cred
      //// ui >>> bloc  >>> data
      /// user >>> bloc >>> ui
      final user = await _authRepo.SingUpWithEmailandPassword(
        email: event.email,
        password: event.password,
        name: 'name',
      );

      if (user != null) {
        emit(SignUpSuccess(user.email!));
      } else {
        emit(SignUpFailure('Email already in use'));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure('erro is  >>>>>>> ${e.toString()}'));
    }
  }
}

void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
  emit(SignUpInitial());
}

void _onSignUpIniti(InitiSingUpScreenEvent event, Emitter<SignUpState> emit) {
  emit(SignUpInitial());
}
