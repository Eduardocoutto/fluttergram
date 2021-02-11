// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegisterController = BindInject(
  (i) => RegisterController(
      i<RegisterWithEmail>(), i<LoadingDialog>(), i<AuthStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<LoginCredential> _$credentialComputed;

  @override
  LoginCredential get credential => (_$credentialComputed ??=
          Computed<LoginCredential>(() => super.credential,
              name: '_RegisterControllerBase.credential'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_RegisterControllerBase.isValid'))
      .value;

  final _$remembermePasswordAtom =
      Atom(name: '_RegisterControllerBase.remembermePassword');

  @override
  bool get remembermePassword {
    _$remembermePasswordAtom.reportRead();
    return super.remembermePassword;
  }

  @override
  set remembermePassword(bool value) {
    _$remembermePasswordAtom.reportWrite(value, super.remembermePassword, () {
      super.remembermePassword = value;
    });
  }

  final _$inloadingAtom = Atom(name: '_RegisterControllerBase.inloading');

  @override
  bool get inloading {
    _$inloadingAtom.reportRead();
    return super.inloading;
  }

  @override
  set inloading(bool value) {
    _$inloadingAtom.reportWrite(value, super.inloading, () {
      super.inloading = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
remembermePassword: ${remembermePassword},
inloading: ${inloading},
email: ${email},
password: ${password},
credential: ${credential},
isValid: ${isValid}
    ''';
  }
}
