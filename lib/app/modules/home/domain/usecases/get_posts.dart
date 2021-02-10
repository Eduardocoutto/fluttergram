import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/repositories/post_repository.dart';

part 'get_posts.g.dart';

abstract class GetPostsUseCase {
  Future<Either<Failure, Stream<List<PostModel>>>> call();
}

@Injectable(singleton: false)
class GetPostsUseCaseImpl implements GetPostsUseCase {
  final IPostRepository repository;

  GetPostsUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, Stream<List<PostModel>>>> call() async {
    return await repository.getPosts();
  }
}
