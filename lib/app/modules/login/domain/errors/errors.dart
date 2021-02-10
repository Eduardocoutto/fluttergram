import 'package:fluttergram/app/core/erros/errors.dart';

class ErrorLoginEmail extends Failure {
  final String message;
  ErrorLoginEmail({this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({this.message});
}

class ErrorLoginPhone implements Failure {
  final String message;
  ErrorLoginPhone({this.message});
}

class NotAutomaticRetrieved implements Failure {
  final String verificationId;
  final String message;
  NotAutomaticRetrieved(this.verificationId, {this.message});
}
