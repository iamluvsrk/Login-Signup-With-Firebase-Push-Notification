part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.email,
    required this.isEmailvalid,
    this.password,
    this.confirmPassword,
    required this.isPasswordValid,
    required this.formStatus,
    this.emailIdError,
    this.passwordError,
    this.isConfirmPasswordValid,
    this.confirmpasswordError,
    this.pageStatus,
  });
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool isEmailvalid;
  final bool isPasswordValid;
  final FormStatus formStatus;
  final String? emailIdError;
  final String? passwordError;
  final String? confirmpasswordError;
  final bool? isConfirmPasswordValid;
  final PageStatus? pageStatus;

  static initial() {
    return const SignupState(
        email: '',
        isEmailvalid: false,
        password: '',
        isPasswordValid: false,
        formStatus: FormStatus.init,
        emailIdError: '',
        passwordError: '',
        confirmPassword: '',
        isConfirmPasswordValid: false,
        confirmpasswordError: '',
        pageStatus: PageStatus.init,
        );
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
        confirmPassword,
        confirmpasswordError,
        isConfirmPasswordValid,
        pageStatus
      ];

  SignupState copyWith({
    String? email,
    String? password,
    bool? isEmailvalid,
    bool? isPasswordValid,
    FormStatus? formStatus,
    String? emailIdError,
    String? passwordError,
    String? confirmPassword,
    String? confirmpasswordError,
    bool? isConfirmPasswordValid,
    PageStatus? pageStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      isEmailvalid: isEmailvalid ?? this.isEmailvalid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      formStatus: formStatus ?? this.formStatus,
      emailIdError: emailIdError ?? this.emailIdError,
      passwordError: passwordError ?? this.passwordError,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmpasswordError: confirmpasswordError ?? this.confirmpasswordError,
      isConfirmPasswordValid:
        isConfirmPasswordValid ?? this.isConfirmPasswordValid,
           pageStatus: pageStatus ?? this.pageStatus,
    );
  }
}
