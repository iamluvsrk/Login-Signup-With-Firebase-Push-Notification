import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/domain/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

/// A [LoginBloc] that manages 'Home Screen' as its state
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginState.initial()) {
    on<EmailValidation>(_emailValidation);
    on<PasswordValidation>(_passwordValidation);
    on<FormValidation>(_formValidation);
    on<UpdateEmailError>(_updateEmailError);
    on<UpdatePasswordError>(_updatePasswordError);
    on<ResetLoginScreen>(_resetLoginScreen);
    on<Login>(_login);
  }

  _resetLoginScreen(ResetLoginScreen event, Emitter<LoginState> emit) {
    emit(LoginState.initial());
  }

  _emailValidation(EmailValidation event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
      isEmailvalid: event.email.trim().isNotEmpty,
    ));
    add(FormValidation());
    add(UpdateEmailError(email: event.email));
  }

  _passwordValidation(PasswordValidation event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        password: event.password,
        isPasswordValid: event.password.trim().isNotEmpty &&
            event.password.trim().length == 8));
    add(FormValidation());
    add(UpdatePasswordError(password: event.password));
  }

  _updateEmailError(UpdateEmailError event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
      emailIdError: event.email.trim().isEmpty ||
              !RegExp(r'\S+@\S+\.\S+').hasMatch(event.email)
          ? 'Email ID is Not valid'
          : '',
    ));
  }

  _updatePasswordError(UpdatePasswordError event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
      passwordError:
          event.password.trim().isEmpty || event.password.trim().length < 8
              ? 'Password length is 8'
              : '',
    ));
  }

  _formValidation(FormValidation event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        formStatus: state.isEmailvalid == true && state.isPasswordValid == true
            ? FormStatus.valid
            : FormStatus.invalid));
  }

  _login(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(pageStatus: PageStatus.loading));
    final res = await authRepository.loginUser(state.email!, state.password!);
    if (res.isLeft()) {
      emit(state.copyWith(pageStatus: PageStatus.failure));
    } else {
      emit(state.copyWith(pageStatus: PageStatus.success));
    }
  }
}
