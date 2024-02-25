import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SignUpcontroller extends GetxController {
  RxBool trailingIconStatus = true.obs;
  RxBool obscureTextStatus = false.obs;
   TextEditingController firstNameController =  TextEditingController();
   TextEditingController lastNameController = TextEditingController();
   TextEditingController emailAddressController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController passwordController = TextEditingController();



  static void goToLogin() {
    Get.toNamed('/login');
  }

  void handleGoogleSignUp() {}

  static handleSubmitForm() {}

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }
}
