import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resourses/color.dart';
import 'package:flutter_mvvm/resourses/font.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback? onPress;

  const AppButton(
      {required this.title,
      this.loading = false,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onPress,
        child: Container(
          height: height / 16,
          width: width / 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primary,
          ),
          child: Center(
              child: loading
                  ? CircularProgressIndicator(color: Colors.white,)
                  : Text(
                      title,
                      style: RobotoFonts.medium(
                          fontSize: 16, color: AppColor.primaryLight),
                    )),
        ));
  }
}
