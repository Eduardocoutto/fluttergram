import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/core/stores/auth_store.dart';
import 'package:fluttergram/app/modules/home/domain/entities/post.dart';
import 'package:fluttergram/app/modules/home/domain/usecases/delete_post.dart';
import 'package:fluttergram/app/modules/home/domain/usecases/get_posts.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetPostsUseCase getPostsUseCase;
  final DeletePostUseCase deletePostUseCase;
  final AuthStore authStore;

  _HomeControllerBase(
      this.getPostsUseCase, this.deletePostUseCase, this.authStore) {
    loadPosts();
  }

  @observable
  ObservableStream postList;

  @action
  Future<void> loadPosts() async {
    try {
      var result = await getPostsUseCase();

      result.fold((failure) {
        print('ocorreu um erro');
      }, (data) {
        postList = data.asObservable();
      });
    } catch (e) {
      debugPrint(e);
    }
  }

  @action
  Future<void> delete(PostModel model) async {
    try {
      var result = await deletePostUseCase(model);

      result.fold((failure) {
        print('ocorreu um erro');
      }, (data) {
        print('Delete com sucesso');
      });
    } catch (e) {
      debugPrint(e);
    }
  }

  @action
  void logout() {
    authStore.signOut();
  }
}
