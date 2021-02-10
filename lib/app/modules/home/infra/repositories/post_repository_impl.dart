import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/erros/errors.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/repositories/post_repository.dart';
import 'package:fluttergram/app/modules/home/infra/datasources/post_datasource.dart';

part 'post_repository_impl.g.dart';

@Injectable(singleton: false)
class PostRepositoryImpl implements IPostRepository {
  final PostDataSource dataSource;

  PostRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Stream<List<PostModel>>>> getPosts() async {
    try {
      var stream = dataSource.getPosts();
      return Right(stream);
    } catch (e) {
      return Left(
          InternalError(message: 'Não foi possível realizar a consulta.'));
    }
  }
}
