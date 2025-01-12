import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/weather_colors.dart';
import 'package:weather_app/utils/weather_textstyle.dart';

class CustomContainer extends StatelessWidget {
  final Color gradientColor1, gradientColor2;
  final String text, imagePath, day;

  const CustomContainer({
    super.key,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.text,
    required this.imagePath,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172.h,
      width: 82.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50.r,
        ),
        gradient: LinearGradient(
          colors: [gradientColor1, gradientColor2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NormalText(
              text: text,
              fontSize: 20,
              color: WeatherColors.white,
            ),
            Image.asset(imagePath),
            NormalText(
              text: day,
              fontSize: 20,
              color: WeatherColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
