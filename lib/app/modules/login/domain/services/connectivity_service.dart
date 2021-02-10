import 'package:dartz/dartz.dart';
import 'package:fluttergram/app/core/erros/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
