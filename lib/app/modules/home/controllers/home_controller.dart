import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    googleSign =GoogleSignIn(scopes: <String>["email"]);
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed(Routes.WELCOME, arguments: firebaseAuth.currentUser);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
