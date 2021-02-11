import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                      '\nFLUTTERGRAM',
                    ],
                    textStyle: TextStyle(fontSize: 50.0),
                    colors: [
                      Colors.black,
                      Colors.grey,
                    ],
                    textAlign: TextAlign.start,
                  ),
                ),
                TextField(
                  onChanged: controller.setEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: controller.setPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed:
                              controller.isValid ? controller.enterEmail : null,
                          child: Text("ENTRAR",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
