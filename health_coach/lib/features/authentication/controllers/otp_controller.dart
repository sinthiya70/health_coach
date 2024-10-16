

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:health_coach/pages/home_page/homepage.dart';
import 'package:health_coach/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified =await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified? Get.offAll(const HomePage()) : Get.back();
  }
}