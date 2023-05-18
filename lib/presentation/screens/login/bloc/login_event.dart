part of 'login_bloc.dart';

/// Event being processed by [LoginEvent]
@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// Notify Bloc to handles the Email validation
class EmailValidation extends LoginEvent {
  const EmailValidation({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

/// Notify Bloc to handles the Password validation
class PasswordValidation extends LoginEvent {
  const PasswordValidation({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

/// Notify Bloc to handles the Email error state
class UpdateEmailError extends LoginEvent {
  const UpdateEmailError({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

/// Notify Bloc to handles the Password error state
class UpdatePasswordError extends LoginEvent {
  const UpdatePasswordError({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

/// Notify Bloc to handles form validation(valid or invalid)
class FormValidation extends LoginEvent {}

/// Notify Bloc to login the user
class Login extends LoginEvent {}

/// Notify Bloc to reset the login screen
class ResetLoginScreen extends LoginEvent {}
