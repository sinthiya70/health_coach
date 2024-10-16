import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/image_strings.dart';
import '../../../const/text_strings.dart';
import '../login.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(height: 50),

        // TextButton for sign-up
        TextButton(
          onPressed: () {
            Get.to(() => const Login());
            // Navigate to signup page
          },
          child: Text.rich(
            TextSpan(
              text: "Have an account? ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: "Login",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}