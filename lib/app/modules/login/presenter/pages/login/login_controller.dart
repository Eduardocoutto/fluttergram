import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/services/notification_service.dart';
import 'package:fluttergram/app/core/stores/auth_store.dart';
import 'package:fluttergram/app/modules/login/domain/entities/login_credential.dart';
import 'package:fluttergram/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:fluttergram/app/modules/login/presenter/utils/loading_dialog.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithEmail loginWithEmailUsecase;
  final LoadingDialog loading;
  final AuthStore authStore;

  _LoginControllerBase(
      this.loginWithEmailUsecase, this.loading, this.authStore);

  @observable
  bool remembermePassword = false;

  @observable
  String email = "";

  @action
  setEmail(String value) => this.email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => this.password = value;

  @computed
  LoginCredential get credential =>
      LoginCredential.withEmailAndPassword(email: email, password: password);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  enterEmail() async {
    loading.show();
    await Future.delayed(Duration(seconds: 1));
    var result = await loginWithEmailUsecase(credential);
    await loading.hide();
    result.fold((failure) {
      NotificationService.notify(
        msg: failure.message,
        type: NOTIFICATION_TYPE.error,
        duration: Duration(seconds: 3),
      );
    }, (user) {
      authStore.setUser(user);
      Modular.to.popUntil(ModalRoute.withName(Modular.link.modulePath));
      Modular.to.pop();
    });
  }
}
