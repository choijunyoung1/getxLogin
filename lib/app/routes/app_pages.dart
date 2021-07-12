import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/bindings/home_binding.dart';
import 'package:getx_login/app/modules/home/bindings/login_binding.dart';
import 'package:getx_login/app/modules/home/bindings/welcome_binding.dart';
import 'package:getx_login/app/modules/home/views/home_view.dart';
import 'package:getx_login/app/modules/home/views/login_view.dart';
import 'package:getx_login/app/modules/home/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
