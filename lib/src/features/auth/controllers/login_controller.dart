import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController= TextEditingController();
  void goToLogin(){
    // Get.to(Login());
  }
  void handleGoogleSignUp() {}

  static handleSubmitForm() {}

  static goForgotPassword(){
    Get.toNamed("/forgot_password");
  }

  static void goToRegister() {
    Get.toNamed('/register');
  }

  handleOtpSubmit() {}

  sendOtpCode() {
    Get.offNamed("/otp");
  }

  goBack() {
    Get.back();
  }

}

