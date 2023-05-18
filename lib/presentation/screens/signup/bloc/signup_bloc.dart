import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/domain/repository/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

/// A [SignupBloc] that manages 'Home Screen' as its state
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc(this.authRepository) : super(SignupState.initial()) {
    on<EmailValidation>(_emailValidation);
    on<PasswordValidation>(_passwordValidation);
    on<ConfirmPasswordValidation>(_confirmPasswordValidation);
    on<SignupFormValidation>(_signupFormValidation);
    on<UpdateEmailError>(_updateEmailError);
    on<UpdatePasswordError>(_updatePasswordError);
    on<UpdateConfirmPasswordError>(_updateConfirmPasswordError);
    on<RemoveConfirmPassword>(_removeConfirmPassword);
    on<ResetSignupScreen>(_resetSignupScreen);
    on<Signup>(_signup);
  }

  _resetSignupScreen(ResetSignupScreen event, Emitter<SignupState> emit) {
    emit(SignupState.initial());
  }

  _emailValidation(EmailValidation event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      email: event.email,
      isEmailvalid: event.email.trim().isNotEmpty && RegExp(r'\S+@\S+\.\S+').hasMatch(event.email),
    ));
    add(SignupFormValidation());
    add(UpdateEmailError(email: event.email));
  }

  _passwordValidation(PasswordValidation event, Emitter<SignupState> emit) {
    emit(state.copyWith(
        password: event.password,
        isPasswordValid: event.password.trim().isNotEmpty &&
            event.password.trim().length == 8));
    add(SignupFormValidation());
    add(UpdatePasswordError(password: event.password));
    add(RemoveConfirmPassword());
    //  add(const ConfirmPasswordValidation(rePassword: ''));
  }

  _confirmPasswordValidation(
      ConfirmPasswordValidation event, Emitter<SignupState> emit) {
    emit(state.copyWith(
        confirmPassword: event.rePassword,
        isConfirmPasswordValid: event.rePassword.trim().isNotEmpty &&
            event.rePassword.trim().length == 8 &&
            state.password == event.rePassword));
    print(state.password == event.rePassword);
    add(SignupFormValidation());
    add(UpdateConfirmPasswordError(rePassword: event.rePassword));
  }

  _updateEmailError(UpdateEmailError event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      email: event.email,
      emailIdError: event.email.trim().isEmpty ||
              !RegExp(r'\S+@\S+\.\S+').hasMatch(event.email)
          ? 'Email ID is Not valid'
          : '',
    ));
  }

  _updatePasswordError(UpdatePasswordError event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      password: event.password,
      passwordError:
          event.password.trim().isEmpty || event.password.trim().length < 8
              ? 'Password length is 8'
              : '',
    ));
  }

  _updateConfirmPasswordError(
      UpdateConfirmPasswordError event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      confirmPassword: event.rePassword,
      confirmpasswordError: event.rePassword.trim() != state.password!.trim()
          ? 'Password Not matched'
          : '',
    ));
  }

  _signupFormValidation(SignupFormValidation event, Emitter<SignupState> emit) {
    emit(state.copyWith(
        formStatus: state.isEmailvalid == true &&
                state.isPasswordValid == true &&
                state.isConfirmPasswordValid == true
            ? FormStatus.valid
            : FormStatus.invalid));
  }

  _removeConfirmPassword(
      RemoveConfirmPassword event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      confirmPassword: '',
      isConfirmPasswordValid: false,
    ));
  }

  _signup(Signup event, Emitter<SignupState> emit) async {
    emit(state.copyWith(pageStatus: PageStatus.loading));
    final res = await authRepository.createUser(state.email!, state.password!);
    if (res.isLeft()) {
      emit(state.copyWith(pageStatus: PageStatus.failure));
    } else {
      emit(state.copyWith(pageStatus: PageStatus.success));
    }
  }
}
