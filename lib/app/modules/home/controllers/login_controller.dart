import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/home_controller.dart';
import 'package:getx_login/app/modules/home/customFullScreenDialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void loginGoogle() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await homeController.googleSign.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    }
  }

  void loginFacebook()async{
    CustomFullScreenDialog.showDialog();
    final LoginResult result=await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
    if (result == null) {
      CustomFullScreenDialog.cancelDialog();
    }
    else{
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    }

  }
}
