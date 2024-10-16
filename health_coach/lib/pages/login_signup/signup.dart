import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_coach/pages/login_signup/widgets/form_header_widget.dart';
import 'package:health_coach/pages/login_signup/widgets/signup_footer_widget.dart';
import 'package:health_coach/pages/login_signup/widgets/signup_form_widget.dart';

import '../../const/color_is.dart';
import '../../const/image_strings.dart';
import '../../const/sizes.dart';
import '../../const/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Coloris.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                FormHeaderWidget(
                  image: tHealthLogo, // Your logo image
                  title: tSignUpTitle1, // "Sign Up" text
                 subTitle: tSignUpSubTitle1, // Sub-title text
                  imageHeight: 0.09,
                  heightBetween: 10.0, // Spacing between header and subtitle
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
