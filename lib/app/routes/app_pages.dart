import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/bindings/chat_screen_binding.dart';
import 'package:getx_login/app/modules/home/bindings/chatlist_binding.dart';
import 'package:getx_login/app/modules/home/bindings/home_binding.dart';
import 'package:getx_login/app/modules/home/bindings/login_binding.dart';
import 'package:getx_login/app/modules/home/bindings/welcome_binding.dart';
import 'package:getx_login/app/modules/home/views/chat_screen.dart';
import 'package:getx_login/app/modules/home/views/chatlist_view.dart';
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
    GetPage(
      name: _Paths.CHATLIST,
      page: () => ChatlistView(),
      binding: ChatlistBinding(),
    ),
    GetPage(
      name: _Paths.CHATSCREEN,
      page: () => ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
  ];
}
