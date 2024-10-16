import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_coach/pages/login_signup/login.dart';
import 'package:health_coach/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:health_coach/common_widgets/fade_in_animation/animation_design.dart';
import 'package:health_coach/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:health_coach/const/image_strings.dart';
import 'package:health_coach/const/sizes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only initialize the controller once
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    // Use Future.delayed to navigate to the Login screen only once
    Future.delayed(const Duration(seconds: 5), () {
      // Use Get.off() to remove the Splash screen from the stack and navigate to Login
      Get.off(() => const Login()); // Ensures that the SplashScreen is removed from the stack
    });

    return Scaffold(
      backgroundColor: const Color(0xFFD0F0C0), // Light Tea Green background
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animate: TAnimatePosition(
              topAfter: 0,
              topBefore: -100,
              leftBefore: -100,
              leftAfter: 0,
            ),
            child: const Image(image: AssetImage(tSplashTopIcon)),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
              topBefore: 80,
              topAfter: 86,
              leftAfter: tDefaultSize,
              leftBefore: -80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mental health matters',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 380,
              leftBefore: MediaQuery.of(context).size.width / 2 - 100,
              leftAfter: MediaQuery.of(context).size.width / 2 - 100,
            ),
            child: const Image(
              image: AssetImage(tSplashTImage),
              width: 200,
              height: 200,
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: tDefaultSize,
              rightAfter: tDefaultSize,
            ),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
