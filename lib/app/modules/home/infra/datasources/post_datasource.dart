import 'dart:async';

import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

abstract class PostDataSource {
  Stream<List<PostModel>> getPosts();
}
