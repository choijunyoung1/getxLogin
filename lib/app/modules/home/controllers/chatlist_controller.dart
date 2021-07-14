
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/home_controller.dart';
import 'package:getx_login/app/routes/app_pages.dart';

class ChatlistController extends GetxController{
  HomeController homeController = Get.find<HomeController>();
  late User user;
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void routeChatScreen(){
    Get.toNamed(Routes.CHATSCREEN,arguments: user);
  }
}