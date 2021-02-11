import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/stores/auth_store.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/presenter/pages/post/post_controller.dart';
import 'package:validadores/Validador.dart';

class PostPage extends StatefulWidget {
  final String title;
  final PostModel model;
  const PostPage({Key key, this.model, this.title = "Post"}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState(model);
}

class _PostPageState extends ModularState<PostPage, PostController> {
  final authStore = Modular.get<AuthStore>();
  final PostModel model;

  _PostPageState(this.model);

  @override
  void initState() {
    controller.model = model;
    controller.titleTextController.text = (model.title ?? '');
    controller.descriptionTextController.text = (model.description ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 14,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.save_alt,
        ),
        onPressed: () {
          controller.save();
        },
      ),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Observer(
        builder: (_) {
          if (controller.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.titleTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Título",
                  ),
                  validator: (value) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: 'Informe o título')
                        .valido(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.descriptionTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descrição",
                  ),
                  validator: (value) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: 'Informe uma descrição')
                        .valido(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                _buildPreviewImage(),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                          color: Colors.black87,
                          child: Text(
                            'ESCOLHER FOTO',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            controller
                                .chooseImage()
                                .whenComplete(() => {setState(() {})});
                          }),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                          color: Colors.black87,
                          child: Text(
                            'ENVIAR',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            controller.save();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewImage() {
    return Observer(builder: (_) {
      if (controller.imgFile == null) {
        return Container();
      }
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.all(10),
        child: Image.file(
          controller.imgFile,
          fit: BoxFit.fitWidth,
        ),
      );
    });
  }
}
