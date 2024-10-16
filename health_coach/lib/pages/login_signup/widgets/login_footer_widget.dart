import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/image_strings.dart'; // Ensure the correct path for image strings
import '../../../const/text_strings.dart';
import '../signup.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // "OR" text positioned slightly higher
        Transform.translate(
          offset: Offset(0, -15), // Adjust the Y value to move the text up
          child: Text(
            "OR",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),

        // Spacer for the button placement
        const SizedBox(height: 4),

        // Single Google Sign-In Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage('assets/logo/google_logo.png'), // Match the asset path in pubspec.yaml
              width: 20.0,
            ),
            onPressed: () {
              // Implement Google sign-in functionality here
            },
            label: const Text(tSignInWithGoogle),
          ),
        ),

        // Spacer for the "Don't have an account" TextButton
        const SizedBox(height: 40),

        // TextButton for sign-up
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
            // Navigate to signup page
          },
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: tSignup,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
