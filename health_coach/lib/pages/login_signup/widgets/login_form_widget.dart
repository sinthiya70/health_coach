import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_coach/const/sizes.dart';
import 'package:health_coach/const/text_strings.dart';

import '../../../const/color_is.dart';
import '../../../features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../../../features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../../home_page/homepage.dart';

// Define your constants
const String tEmail = "Email Address";
const String tPassword = "Password";
const String tForgetPassword = "Forgot Password?";
const String tLogin = "Login";
const double tFormHeight = 50.0; // Set an appropriate height for spacing

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    const BorderSide(color: Coloris.green, width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Coloris.liteGreen, width: 2.0)),



              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                    const BorderSide(color: Coloris.green, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Coloris.liteGreen, width: 2.0)),
                suffixIcon: IconButton(
                  onPressed: () {
                    // Implement toggle for password visibility here
                  },
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 35),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(tForgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const HomePage());

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,backgroundColor: Coloris.teaGreen, // Text color for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Coloris.green, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                ),
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


