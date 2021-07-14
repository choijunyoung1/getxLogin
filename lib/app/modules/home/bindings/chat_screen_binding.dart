import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/chat_screen_controller.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatScreenController>(ChatScreenController());
  }
}
