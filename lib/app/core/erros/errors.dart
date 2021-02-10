abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({this.message});
}

class InternalError implements Failure {
  final String message;
  InternalError({this.message});
}
