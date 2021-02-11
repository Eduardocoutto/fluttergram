import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttergram/app/modules/login/presenter/pages/register/register_controller.dart';
import 'package:fluttergram/app/modules/login/presenter/pages/register/register_page.dart';
import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_email.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/register_with_email.dart';
import 'external/datasources/firebase_datasource.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'infra/services/connectivity_service_impl.dart';
import 'external/drivers/flutter_connectivity_driver_impl.dart';
import 'presenter/pages/login/login_controller.dart';
import 'presenter/pages/login/login_page.dart';
import 'presenter/utils/loading_dialog.dart';

class LoginModule extends ChildModule {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $FirebaseDataSourceImpl,
    $ConnectivityServiceImpl,
    $FlutterConnectivityDriver,
  ];

  @override
  List<Bind> get binds => [
        $LoginController,
        $RegisterController,
        $LoginWithEmailImpl,
        $RegisterWithEmailImpl,
        $LoadingDialogImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
        ModularRouter("/register", child: (context, args) => RegisterPage()),
      ];
}
