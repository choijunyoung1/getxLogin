import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login/app/modules/home/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            height: 20,
          ),
          Text(
            "Google SignIn",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: context.width),
              child: ElevatedButton(
                child: Text(
                  "Sign In with Google",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  controller.loginGoogle();
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: context.width),
              child: ElevatedButton(
                child: Text(
                  "Sign In with Facebook",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  controller.loginFacebook();
                },
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
