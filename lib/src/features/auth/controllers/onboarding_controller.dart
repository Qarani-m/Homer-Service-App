import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();

  void goToLogin() {
    Get.toNamed("/login");
  }

  void animateToNextPage(index) {
    print("====");
    pageController.animateToPage(
      index++,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
