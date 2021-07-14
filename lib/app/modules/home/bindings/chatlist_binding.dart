import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/chatlist_controller.dart';

import '../controllers/home_controller.dart';

class ChatlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatlistController>(ChatlistController());
  }
}