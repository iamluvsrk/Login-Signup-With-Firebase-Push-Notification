import 'package:dartz/dartz.dart';
import 'package:login_demo/core/error/app_errors.dart';

abstract class AuthRepository {
  Future<Either<AppException, bool>> createUser( String email, String password); // Create User
  Future<Either<AppException, bool>> loginUser(String email, String password); // Login User
  Future<Either<AppException, bool>> logoutUser(); // Logout User
}
