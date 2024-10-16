

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../pages/login_signup/login.dart';


import 'package:get/get.dart';
import '../../pages/login_signup/login.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;
  bool _navigated = false; // Flag to prevent double navigation

  // Starts the splash animation and handles navigation
  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true; // Trigger the animation

    await Future.delayed(const Duration(milliseconds: 3000)); // Duration for animation

    // Navigate only once
    if (!_navigated) {
      _navigated = true; // Mark as navigated
      Get.offAll(() => const Login()); // Ensure single navigation to login screen
    }
  }

  // Can be used for other animations, not just splash
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}




