import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/presenter/pages/home/home_controller.dart';
import 'package:fluttergram/app/modules/home/presenter/widgets/post_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Fluttergram"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingButton(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: _buildActionsAppBar(context),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Observer(builder: (_) {
          return controller.authStore.isLogged
              ? _getLoggedScreen()
              : _getLogoutScreen();
        }),
      ),
    );
  }

  List<Widget> _buildActionsAppBar(BuildContext context) {
    return [
      Observer(builder: (_) {
        return FlatButton(
          child: FaIcon(
            FontAwesomeIcons.user,
            color: controller.authStore.isLogged ? Colors.white : Colors.black,
          ),
          onPressed: () {
            if (controller.authStore.isLogged) {
              logout(context);
            }
          },
        );
      }),
    ];
  }

  Observer _buildFloatingButton() {
    return Observer(
      builder: (_) {
        if (!controller.authStore.isLogged) {
          return Container();
        }
        return FloatingActionButton(
          elevation: 14,
          backgroundColor: Colors.black,
          child: FaIcon(
            FontAwesomeIcons.plus,
          ),
          onPressed: () {
            Modular.link.pushNamed('/post/:model', arguments: PostModel());
          },
        );
      },
    );
  }

  Widget _getLoggedScreen() {
    return Column(
      children: [
        //_buildHeader(),
        Expanded(
          child: _buildCardPosts(),
        ),
      ],
    );
  }

  Widget _buildCardPosts() {
    return Observer(builder: (context) {
      if (controller.postList == null ||
          controller.postList.status == StreamStatus.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (controller.postList.hasError) {
        return RaisedButton(
          onPressed: controller.loadPosts,
          child: Text('Ocorreu um erro'),
        );
      }

      List<PostModel> list = controller.postList.data;

      if (list.length == 0) {
        return Center(
          child: Text('Sem publicações para exibir'),
        );
      }

      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            PostModel model = list[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildCard(model, context),
            );
          });
    });
  }

  PostCard _buildCard(PostModel model, BuildContext context) {
    return PostCard(
      model: model,
      deleteFunction: () {
        deletePhoto(model, context);
      },
    );
  }

  Widget _getLogoutScreen() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          Modular.to.pushNamed("/login");
                        },
                        child: Text(
                          "COMEÇAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          Modular.to.pushNamed("/login/register");
                        },
                        child: Text(
                          "REGISTRAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conectado como'),
          content: Text(controller.authStore.user?.email ?? ''),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'SAIR',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                controller.logout();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'VOLTAR',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deletePhoto(PostModel model, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Deseja realmente excluir a foto?'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'CONFIRMAR',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                controller.delete(model);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'VOLTAR',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
