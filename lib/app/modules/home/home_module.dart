import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/modules/home/domain/usecases/save_post.dart';
import 'package:fluttergram/app/modules/home/presenter/pages/post/post_controller.dart';
import 'package:fluttergram/app/modules/home/presenter/pages/post/post_page.dart';

import 'domain/usecases/delete_post.dart';
import 'domain/usecases/get_posts.dart';
import 'infra/datasources/post_datasource_firebase.dart';
import 'infra/repositories/post_repository_impl.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';

class HomeModule extends ChildModule {
  static List<Bind> export = [
    $PostRepositoryImpl,
  ];

  @override
  List<Bind> get binds => [
        $PostDataSourceFirebase,
        $GetPostsUseCaseImpl,
        $SavePostUseCaseImpl,
        $DeletePostUseCaseImpl,
        $HomeController,
        $PostController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/post/:model',
            child: (_, args) => PostPage(
                  model: args.data,
                )),
      ];
}
