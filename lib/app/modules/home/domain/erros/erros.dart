import 'package:fluttergram/app/core/erros/errors.dart';

class NoFileUpload extends Failure {
  final String message;
  NoFileUpload({this.message = 'Nenhum arquivo foi selecionado.'});
}
