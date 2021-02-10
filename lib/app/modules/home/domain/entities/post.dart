import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String title;
  String description;
  String photoUrl;

  DocumentReference reference;

  PostModel({
    this.title,
    this.description,
    this.photoUrl,
  });

  factory PostModel.fromDocument(DocumentSnapshot doc) {
    return PostModel(
        title: doc['title'],
        description: doc['description'],
        photoUrl: doc['photoUrl']);
  }
}
