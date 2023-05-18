import 'package:get_it/get_it.dart';
import 'package:login_demo/data/repositories/auth_repository_impl.dart';
import 'package:login_demo/domain/repository/auth_repository.dart';
import 'package:login_demo/presentation/screens/home/bloc/home_bloc.dart';
import 'package:login_demo/presentation/screens/login/bloc/login_bloc.dart';
import 'package:login_demo/presentation/screens/signup/bloc/signup_bloc.dart';

final getItInstance = GetIt.I;

init()async {
getItInstance.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl());
getItInstance.registerLazySingleton<SignupBloc>(()=>SignupBloc(getItInstance()));
getItInstance.registerLazySingleton<LoginBloc>(()=>LoginBloc(getItInstance()));
getItInstance.registerLazySingleton<HomeBloc>(()=>HomeBloc(getItInstance()));
}