// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PostController = BindInject(
  (i) => PostController(i<SavePostUseCase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostController on _PostControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_PostControllerBase.isValid'))
      .value;

  final _$imgFileAtom = Atom(name: '_PostControllerBase.imgFile');

  @override
  File get imgFile {
    _$imgFileAtom.reportRead();
    return super.imgFile;
  }

  @override
  set imgFile(File value) {
    _$imgFileAtom.reportWrite(value, super.imgFile, () {
      super.imgFile = value;
    });
  }

  final _$loadingAtom = Atom(name: '_PostControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_PostControllerBase.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$chooseImageAsyncAction =
      AsyncAction('_PostControllerBase.chooseImage');

  @override
  Future<void> chooseImage() {
    return _$chooseImageAsyncAction.run(() => super.chooseImage());
  }

  @override
  String toString() {
    return '''
imgFile: ${imgFile},
loading: ${loading},
isValid: ${isValid}
    ''';
  }
}
