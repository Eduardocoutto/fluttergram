import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/services/notification_service.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/usecases/save_post.dart';
import 'package:mobx/mobx.dart';

part 'post_controller.g.dart';

@Injectable()
class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  final SavePostUseCase savePostUseCase;

  PostModel model;

  _PostControllerBase(
    this.savePostUseCase,
  );

  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @observable
  File imgFile;

  @observable
  bool loading = false;

  @computed
  bool get isValid =>
      titleTextController.text.isNotEmpty &&
      descriptionTextController.text.isNotEmpty;

  @action
  Future<void> save() async {
    try {
      final form = formKey.currentState;
      if (!form.validate()) {
        NotificationService.notify(
          msg: 'Preencha todos os campos',
          type: NOTIFICATION_TYPE.warning,
          duration: Duration(seconds: 3),
        );
        return;
      }

      loading = true;
      model.title = titleTextController.text;
      model.description = descriptionTextController.text;

      var result = await savePostUseCase(model);

      result.fold((failure) {
        NotificationService.notify(
          msg: failure.message,
          type: NOTIFICATION_TYPE.error,
          duration: Duration(seconds: 3),
        );
      }, (data) {
        NotificationService.notify(
          msg: 'Post criado com sucesso!',
          type: NOTIFICATION_TYPE.sucess,
          duration: Duration(seconds: 3),
        );
      });

      loading = false;
      Modular.link.pop();
    } catch (e) {
      debugPrint(e);
    }
  }

  @action
  Future<void> chooseImage() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      imgFile = File(result.files.single.path);
      model.pathUpload = imgFile.path;
      print(imgFile);
    } else {
      NotificationService.notify(
        msg: 'Operação cancelada',
        type: NOTIFICATION_TYPE.warning,
        duration: Duration(seconds: 3),
      );
    }
  }
}
