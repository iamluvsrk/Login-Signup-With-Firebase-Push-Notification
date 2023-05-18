import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/di/di.dart';
import 'package:login_demo/presentation/router/app_router.dart';
import 'package:login_demo/presentation/screens/home/bloc/home_bloc.dart';
import 'package:login_demo/presentation/screens/login/bloc/login_bloc.dart';
import 'package:login_demo/presentation/screens/login/login.dart';
import 'package:login_demo/presentation/screens/signup/bloc/signup_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => getItInstance<LoginBloc>()),
        BlocProvider<SignupBloc>(
            create: (context) => getItInstance<SignupBloc>()),

             BlocProvider<HomeBloc>(
            create: (context) => getItInstance<HomeBloc>())
      ],
      child: MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Monteserrat'),
          onGenerateRoute: AppRouter().onGenerateRoute,
          home: const LoginScreen()),
    );
  }
}
