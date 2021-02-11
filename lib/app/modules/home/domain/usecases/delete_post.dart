import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/repositories/post_repository.dart';

part 'delete_post.g.dart';

abstract class DeletePostUseCase {
  Future<Either<Failure, bool>> call(PostModel postModel);
}

@Injectable(singleton: false)
class DeletePostUseCaseImpl implements DeletePostUseCase {
  final IPostRepository repository;

  DeletePostUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(PostModel postModel) async {
    return await repository.deletePost(postModel);
  }
}
