import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/repositories/post_repository.dart';

part 'save_post.g.dart';

abstract class SavePostUseCase {
  Future<Either<Failure, PostModel>> call(PostModel postModel);
}

@Injectable(singleton: false)
class SavePostUseCaseImpl implements SavePostUseCase {
  final IPostRepository repository;

  SavePostUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, PostModel>> call(PostModel postModel) async {
    return await repository.savePost(postModel);
  }
}
