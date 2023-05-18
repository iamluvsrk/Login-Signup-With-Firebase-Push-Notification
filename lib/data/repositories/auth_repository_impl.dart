import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_demo/constants/extentions.dart';
import 'package:login_demo/core/error/app_errors.dart';
import 'package:login_demo/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<Either<AppException, bool>> createUser(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,);
      return const Right(true);
    } catch (e) {
      return Left(e.toAppException());
    }
  }

  @override
  Future<Either<AppException, bool>> loginUser(
      String email, String password) async {
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password,);
      return const Right(true);
    } catch (e) {
      return Left(e.toAppException());
    }
  }

  @override
  Future<Either<AppException, bool>> logoutUser(
   ) async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(true);
    } catch (e) {
      return Left(e.toAppException());
    }
  }
}
