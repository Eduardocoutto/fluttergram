import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'post_datasource.dart';

part 'post_datasource_firebase.g.dart';

@Injectable(singleton: false)
class PostDataSourceFirebase implements PostDataSource {
  FirebaseFirestore firestore;

  PostDataSourceFirebase(
    this.firestore,
  );

  @override
  Stream<List<PostModel>> getPosts() {
    return firestore.collection('posts').snapshots().map((query) {
      return query.docs.map((doc) {
        return PostModel.fromDocument(doc);
      }).toList();
    });
  }
}
