import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/services/notification_service.dart';
import 'package:fluttergram/app/core/stores/auth_store.dart';
import 'package:fluttergram/app/modules/login/domain/entities/login_credential.dart';
import 'package:fluttergram/app/modules/login/domain/usecases/register_with_email.dart';
import 'package:fluttergram/app/modules/login/presenter/utils/loading_dialog.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterWithEmail registerWithEmail;
  final LoadingDialog loading;
  final AuthStore authStore;

  _RegisterControllerBase(this.registerWithEmail, this.loading, this.authStore);

  @observable
  bool remembermePassword = false;

  final formKey = GlobalKey<FormState>();

  @observable
  bool inloading = false;

  @observable
  String email = "";

  @action
  setEmail(String value) => this.email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => this.password = value;

  @computed
  LoginCredential get credential => LoginCredential.withEmailAndPassword(
      email: emailTextController.text, password: passwordTextController.text);

  @computed
  bool get isValid =>
      credential.isValidEmail &&
      credential.isValidPassword &&
      (passwordTextController.text == confirmPasswordTextController.text);

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  registerEmail() async {
    final form = formKey.currentState;
    if (!form.validate()) {
      NotificationService.notify(
        msg: 'Preencha todos os campos',
        type: NOTIFICATION_TYPE.warning,
        duration: Duration(seconds: 3),
      );
      return;
    }

    loading.show();
    await Future.delayed(Duration(seconds: 1));
    var result = await registerWithEmail(credential);
    await loading.hide();
    result.fold((failure) {
      NotificationService.notify(
        msg: failure.message,
        type: NOTIFICATION_TYPE.error,
        duration: Duration(seconds: 3),
      );
    }, (user) {
      authStore.setUser(user);
      Modular.to.pop();
    });
  }
}
