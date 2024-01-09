import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resourses/color.dart';

import '../resourses/font.dart';

class AppTextFiled extends StatelessWidget {
  final String hintText;
  final String labelText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool obsecureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final   ValueChanged<String>? onFieldSubmitted;
  TextEditingController controller;

  AppTextFiled({this.suffixIcon,this.obsecureText=false,this.onFieldSubmitted,this.keyboardType,this.prefixIcon,this.focusNode,required this.controller,required this.hintText, required this.labelText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obsecureText,
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: RobotoFonts.medium(color:Colors.black,fontSize: 18 ),
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(width: 3, color: AppColor.darkGrey),
        ), focusedBorder:  const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        borderSide: BorderSide(width: 3, color: AppColor.primary),
      ),
        suffixIcon:suffixIcon ,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
