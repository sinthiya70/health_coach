import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_coach/repository/authentication_repository/authentication_repository.dart';
import 'common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'features/authentication/screens/splash-screen/splash_screen.dart';
import 'firebase_options.dart';  // Ensure this is included

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize bindings

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Register repositories and controllers
  Get.put(AuthenticationRepository());
  Get.put(FadeInAnimationController());

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Inter"),
          defaultTransition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500),
          home: SplashScreen(), // Splash screen as the initial screen
        );
      },
    );
  }
}
