import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/screens/ask_screen.dart';
import 'package:weather_app/utils/weather_colors.dart';

import 'package:weather_app/utils/weather_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              WeatherColors.blue,
              WeatherColors.pink,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.mainImage),
              SizedBox(height: 30.h),
              Text(
                "Weather",
                style: TextStyle(
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                  color: WeatherColors.white,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => AskScreen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: WeatherColors.orange,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: WeatherColors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
