import 'package:dartz/dartz.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/login/domain/entities/logged_user_info.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {String email, String password});
  Future<Either<Failure, LoggedUserInfo>> loginPhone({String phone});
  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode(
      {String verificationId, String code});

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
