import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/constants/enum.dart';
import 'package:login_demo/constants/theme.dart';
import 'package:login_demo/di/di.dart';
import 'package:login_demo/presentation/router/routes.dart';
import 'package:login_demo/presentation/screens/signup/bloc/signup_bloc.dart';
import 'package:login_demo/presentation/widgets/account_option.dart';
import 'package:login_demo/presentation/widgets/button.dart';
import 'package:login_demo/presentation/widgets/custom_app_bar.dart';
import 'package:login_demo/presentation/widgets/error_text.dart';
import 'package:login_demo/presentation/widgets/textfield_with_label.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailCntl = TextEditingController();
  final TextEditingController _passwordCntl = TextEditingController();
  final TextEditingController _repasswordCntl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailCntl.clear();
    _passwordCntl.clear();
    _repasswordCntl.clear();
  }

  //Function for Login user
  void _signupUser() {
    getItInstance<SignupBloc>().add(Signup());
  }

// Function to Navigate User to SignUp Screen
  void _navigateToLoginScreen() {
    Navigator.of(context).pushNamed(AppRoutes.login);
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.pageStatus == PageStatus.success) {
            // When User signup successfull it will navigate to the Home Screen nad reset the signup Screen
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          getItInstance<SignupBloc>().add(ResetSignupScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstants.background,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    showbackButton: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      const Text("Signup", style: AppTextStyle.h1),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Create an Account,Its free",
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
                              textInputType: TextInputType.emailAddress,
                              hintText: 'abc@xyz.com',
                              maxLength: 60,
                              textCapitalization: TextCapitalization.none,
                              onChanged: (v) {
                                BlocProvider.of<SignupBloc>(context).add(
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
                              maxLength: 8,
                              fillColor: ColorConstants.white,
                              textInputType: TextInputType.text,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              onChanged: (v) {
                                getItInstance<SignupBloc>().add(
                                    PasswordValidation(
                                        password: _passwordCntl.text));
                                _repasswordCntl.clear();
                              },
                            ),
                            if (state.passwordError != null &&
                                state.passwordError!.isNotEmpty)
                              ErrorText(text: state.passwordError!),
                            const SizedBox(
                              height: 24,
                            ),
                            TextfieldWithlabel(
                              label: 'Confirm Password',
                              controller: _repasswordCntl,
                              obscureText: true,
                              maxLength: 8,
                              fillColor: ColorConstants.white,
                              textInputType: TextInputType.text,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              onChanged: (v) {
                                getItInstance<SignupBloc>().add(
                                    ConfirmPasswordValidation(
                                        rePassword: _repasswordCntl.text));
                              },
                            ),
                            if (state.confirmpasswordError != null &&
                                state.confirmpasswordError!.isNotEmpty)
                              ErrorText(text: state.confirmpasswordError!),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtonWidget(
                              buttonText: 'Signup',
                              isLoading: state.pageStatus == PageStatus.loading,
                              buttonColor: state.formStatus == FormStatus.valid
                                  ? Colors.indigoAccent[400]
                                  : Colors.grey[500],
                              onTap: _signupUser,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AccountOptionWidget(
                                text1: 'Already have an account? ',
                                text2: 'Login',
                                onTap: _navigateToLoginScreen,)
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
