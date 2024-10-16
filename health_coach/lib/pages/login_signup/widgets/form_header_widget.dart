import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.1,
    this.textAlign = TextAlign.center, // Default text alignment set to center
    this.crossAxisAlignment = CrossAxisAlignment.center, // Set crossAxisAlignment to center
  }) : super(key: key);

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Align column items in center
      children: [
        // Wrap image and title in a Row to align them horizontally
        Padding(
          padding: const EdgeInsets.only(top: 50.0), // Adjust the top padding as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
              const SizedBox(width: 5.0),
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        SizedBox(height: heightBetween),
        // Subtitle aligned in the center
        Text(
          subTitle,
          textAlign: textAlign ?? TextAlign.center, // Align subtitle text in the center
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
