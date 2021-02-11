import 'package:flutter/material.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    @required this.model,
    Key key,
    this.deleteFunction,
  }) : super(key: key);

  final PostModel model;
  final Function deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      model.title,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )),
                ],
              ),
              (model.photoUrl ?? '').isNotEmpty
                  ? Container(
                      height: 500,
                      child: Image.network(
                        model.photoUrl ?? '',
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(),
              Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      model.description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                      child: FlatButton(
                    textColor: Colors.blueGrey[600],
                    child: Text('EXCLUIR'),
                    onPressed: () {
                      deleteFunction();
                    },
                  )),
                ],
              )
            ],
          )),
    );
  }
}
