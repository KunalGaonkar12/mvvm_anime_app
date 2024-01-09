

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resourses/font.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    this.place,
    this.value,
    this.child,
  });

  final String? place;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      alignment: Alignment.center,
      child: child ?? Text(
        "$place$value",
        style:
        RobotoFonts.medium(color: Colors.black,fontSize: 15)
      ),
    );
  }
}
