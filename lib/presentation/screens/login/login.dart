import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/constants/theme.dart';
import 'package:login_demo/di/di.dart';
import 'package:login_demo/presentation/router/routes.dart';
import 'package:login_demo/presentation/screens/login/bloc/login_bloc.dart';
import 'package:login_demo/presentation/widgets/account_option.dart';
import 'package:login_demo/presentation/widgets/button.dart';
import 'package:login_demo/presentation/widgets/error_text.dart';
import 'package:login_demo/presentation/widgets/textfield_with_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCntl = TextEditingController();
  final TextEditingController _passwordCntl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailCntl.clear();
    _passwordCntl.clear();
  }

//Function for Login user
  void _loginUser() {
    getItInstance<LoginBloc>().add(Login());
  }

// Function to Navigate User to SignUp Screen
  void _navigateToSignupScreen() {
    Navigator.of(context).pushNamed(AppRoutes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.pageStatus == PageStatus.success) {
          // When User login successfull it will navigate to the Home Screen nad reset the login Screen
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          getItInstance<LoginBloc>().add(ResetLoginScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstants.background,
          body: WillPopScope(
            onWillPop: () {
              return Future.value(true);
            },
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        const Text("Login", style: AppTextStyle.h1),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Welcome back ! Login with your credentials",
                            style: AppTextStyle.para1B
                                .copyWith(color: Colors.grey[700])),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextfieldWithlabel(
                                label: 'Email',
                                controller: _emailCntl,
                                autofocus: true,
                                fillColor: ColorConstants.white,
                                hintText: 'abc@xyz.com',
                                maxLength: 60,
                                textInputType: TextInputType.emailAddress,
                                textCapitalization: TextCapitalization.none,
                                onChanged: (v) {
                                  getItInstance<LoginBloc>().add(
                                      EmailValidation(email: _emailCntl.text));
                                },
                              ),
                              if (state.emailIdError != null &&
                                  state.emailIdError!.isNotEmpty)
                                ErrorText(text: state.emailIdError!),
                              const SizedBox(
                                height: 24,
                              ),
                              TextfieldWithlabel(
                                label: 'Password',
                                controller: _passwordCntl,
                                obscureText: true,
                                fillColor: ColorConstants.white,
                                textInputType: TextInputType.text,
                                autofocus: false,
                                hintText: 'Max password length is 8',
                                maxLength: 8,
                                textCapitalization: TextCapitalization.none,
                                onChanged: (v) {
                                  getItInstance<LoginBloc>().add(
                                      PasswordValidation(
                                          password: _passwordCntl.text));
                                },
                              ),
                              if (state.passwordError != null &&
                                  state.passwordError!.isNotEmpty)
                                ErrorText(text: state.passwordError!),
                              const SizedBox(
                                height: 60,
                              ),
                              ButtonWidget(
                                buttonText: 'Login',
                                isLoading:
                                    state.pageStatus == PageStatus.loading,
                                buttonColor:
                                    state.formStatus == FormStatus.valid
                                        ? Colors.indigoAccent[400]
                                        : Colors.grey[500],
                                onTap: _loginUser,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AccountOptionWidget(
                                text1: 'Dont have an account?',
                                text2: 'Sign Up',
                                onTap: _navigateToSignupScreen,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
