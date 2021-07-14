import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/home_controller.dart';

class MessageController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late User user;
  late ScrollController scrollController;
  bool isAtTopOfChatList = true;
  String lastestMessage = '';
  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  _scrollListener() {
    if (scrollController.offset !=
        scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
        isAtTopOfChatList = false;
    } else {
        isAtTopOfChatList = true;
    }
  }
}