import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

import 'post_datasource.dart';

part 'post_datasource_firebase.g.dart';

@Injectable(singleton: false)
class PostDataSourceFirebase implements PostDataSource {
  FirebaseFirestore firestore;
  FirebaseStorage firebaseStorage;

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

  @override
  Future<PostModel> savePost(PostModel postModel) async {
    if (postModel.reference == null) {
      var reference = await firestore.collection('posts').add({
        'title': postModel.title,
        'description': postModel.description,
        'photoUrl': postModel.photoUrl,
      });
      postModel.reference = reference;
    } else {
      await postModel.reference.set({
        'title': postModel.title,
        'description': postModel.description,
        'photoUrl': postModel.photoUrl,
      });
    }

    return postModel;
  }

  @override
  Future<void> deletePost(PostModel postModel) {
    return postModel.reference.delete();
  }

  @override
  Future<String> uploadPhoto(String path) async {
    var uuid = Uuid();
    File _imageFile = File(path);
    var fileName = uuid.v1();
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    return await taskSnapshot.ref.getDownloadURL();
  }
}
