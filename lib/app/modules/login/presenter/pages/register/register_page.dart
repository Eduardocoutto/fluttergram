import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validadores/Validador.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.inloading) {
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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: ColorizeAnimatedTextKit(
                    isRepeatingAnimation: true,
                    text: [
                      'Registrar',
                    ],
                    textStyle: TextStyle(fontSize: 50.0),
                    colors: [
                      Colors.black,
                      Colors.grey,
                    ],
                    textAlign: TextAlign.start,
                  ),
                ),
                TextFormField(
                  controller: controller.emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    return Validador()
                        .add(Validar.EMAIL, msg: 'Email inválido')
                        .valido(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.passwordTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                  obscureText: true,
                  validator: (value) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: 'Informe uma senha')
                        .valido(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.confirmPasswordTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirmar Senha",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (controller.confirmPasswordTextController.text !=
                        controller.passwordTextController.text) {
                      return '[Senhas não conferem]';
                    }
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: 'Confirme a sua senha')
                        .valido(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            controller.registerEmail();
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
}
