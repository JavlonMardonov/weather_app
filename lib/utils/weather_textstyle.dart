import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Boldtext extends StatelessWidget {
  final String text;
  final double fontSize;

  final Color color;
  const Boldtext({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: FontWeight.bold),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;

  final Color color;
  const NormalText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize.sp),
    );
  }
}
