import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MessageController>(MessageController());
  }
}
