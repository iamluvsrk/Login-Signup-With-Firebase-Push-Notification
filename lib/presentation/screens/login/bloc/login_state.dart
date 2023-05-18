part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  const LoginState({
    this.email,
    required this.isEmailvalid,
    this.password,
    required this.isPasswordValid,
    required this.formStatus,
    this.emailIdError,
    this.passwordError,
    this.pageStatus,
  });
  final String? email;
  final String? password;
  final bool isEmailvalid;
  final bool isPasswordValid;
  final FormStatus formStatus;
  final String? emailIdError;
  final String? passwordError;
  final PageStatus? pageStatus;

  static initial() {
    return const LoginState(
        email: '',
        isEmailvalid: false,
        password: '',
        isPasswordValid: false,
        formStatus: FormStatus.init,
        emailIdError: '',
        passwordError: '',
        pageStatus: PageStatus.init);
  }

  @override
  List<Object?> get props => [
        email,
        isEmailvalid,
        password,
        isPasswordValid,
        formStatus,
        emailIdError,
        passwordError,
        pageStatus,
      ];

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailvalid,
    bool? isPasswordValid,
    FormStatus? formStatus,
    String? emailIdError,
    String? passwordError,
    PageStatus? pageStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      isEmailvalid: isEmailvalid ?? this.isEmailvalid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      formStatus: formStatus ?? this.formStatus,
      emailIdError: emailIdError ?? this.emailIdError,
      passwordError: passwordError ?? this.passwordError,
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }
}
