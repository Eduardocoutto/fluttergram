import 'package:dartz/dartz.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';

abstract class IPostRepository {
  Future<Either<Failure, Stream<List<PostModel>>>> getPosts();
  Future<Either<Failure, PostModel>> savePost(PostModel postModel);
  Future<Either<Failure, bool>> deletePost(PostModel postModel);
}
