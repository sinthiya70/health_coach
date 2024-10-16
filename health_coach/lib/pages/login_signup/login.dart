import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_coach/pages/login_signup/widgets/login_footer_widget.dart';
import 'package:health_coach/pages/login_signup/widgets/login_form_widget.dart';
import 'package:health_coach/pages/login_signup/widgets/login_header_widget.dart';

import '../../const/color_is.dart';
import '../../const/sizes.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        backgroundColor: Coloris.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}