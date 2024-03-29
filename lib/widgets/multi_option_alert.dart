import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resourses/color.dart';

import '../resourses/font.dart';

class MultiOptionAlertDialog extends StatelessWidget {
  String title;
  String content;
  String primaryActionText;
  String secondaryActionText;
  VoidCallback? onPressedPrimary;
  VoidCallback? onPressedSecondary;

  MultiOptionAlertDialog(
      {required this.title,
      required this.content,
      required this.primaryActionText,
      required this.secondaryActionText,
      this.onPressedPrimary,
      this.onPressedSecondary,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Adjust the radius as needed
      ),
      titleTextStyle: RobotoFonts.bold(fontSize: 20),
      content: Text(content, style: RobotoFonts.medium(fontSize: 12)),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            onPressed: onPressedPrimary,
            child: Text(
              primaryActionText,
              style: TextStyle(color: AppColor.primary),
            ),
            style: ButtonStyle(enableFeedback: false)),
        TextButton(
            onPressed: onPressedSecondary,
            child: Text(
              secondaryActionText,
              style: TextStyle(color: AppColor.primary),
            ),
            style: ButtonStyle(enableFeedback: false)),
      ],
    );
    ;
  }
}
