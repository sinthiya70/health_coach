/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/image_strings.dart';
import '../../../const/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage("assets/logo/logo.png"),
            height: size.height * 0.1),

        Text(tLoginTitle, style: Theme.of(context).textTheme.displayLarge),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../const/image_strings.dart';
import '../../../const/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align to center horizontally
      children: [
        SizedBox(height: size.height * 0.1), // Add space at the top to move content down
        Center( // Center the image horizontally
          child: Image(
            image: const AssetImage("assets/logo/logo.png"),
            height: size.height * 0.1, // Adjust the height as needed
          ),
        ),
        const SizedBox(height: 5), // Optional: Add spacing between logo and text
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.headlineMedium, // Smaller text size
        ),
      ],
    );
  }
}
