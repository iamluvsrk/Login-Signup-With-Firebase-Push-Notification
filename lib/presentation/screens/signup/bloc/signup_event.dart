part of 'signup_bloc.dart';

/// Event being processed by [SignupEvent]
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

/// Notify Bloc to handles the Email validation
class EmailValidation extends SignupEvent {
  const EmailValidation({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

/// Notify Bloc to handles the Password validation
class PasswordValidation extends SignupEvent {
  const PasswordValidation({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

/// Notify Bloc to handles the confirm Password validation
class ConfirmPasswordValidation extends SignupEvent {
  const ConfirmPasswordValidation({required this.rePassword});
  final String rePassword;
  @override
  List<Object> get props => [rePassword];
}

/// Notify Bloc to handles the Email error state
class UpdateEmailError extends SignupEvent {
  const UpdateEmailError({required this.email});
  final String email;
  @override
  List<Object?> get props => [email];
}

/// Notify Bloc to handles the Password error state
class UpdatePasswordError extends SignupEvent {
  const UpdatePasswordError({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

/// Notify Bloc to handles the confirm Password error state
class UpdateConfirmPasswordError extends SignupEvent {
  const UpdateConfirmPasswordError({required this.rePassword});
  final String rePassword;
  @override
  List<Object?> get props => [rePassword];
}

/// Notify Bloc to handles form validation(valid or invalid)
class SignupFormValidation extends SignupEvent {}

/// Notify Bloc to remove the confirm passsword
class RemoveConfirmPassword extends SignupEvent {}

/// Notify Bloc to signup the user
class Signup extends SignupEvent {}

/// Notify Bloc to reset the signup screen
class ResetSignupScreen extends SignupEvent {}
