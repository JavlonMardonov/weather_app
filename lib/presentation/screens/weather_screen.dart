import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/presentation/screens/daily_screen.dart';
import 'package:weather_app/utils/weather_colors.dart';
import 'package:weather_app/utils/weather_images.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherResponse responseData;

  const WeatherScreen({required this.responseData, super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
              SizedBox(height: 20.h),
              Stack(
                children: [
                  SizedBox(
                    height: 200.h,
                    width: 330.w,
                    child: Image.asset(
                      AppImages.mainImage,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 15,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => DailyScreen(
                            responseData: widget.responseData,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.menu,
                        color: WeatherColors.white,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 15,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: WeatherColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${widget.responseData.current.tempC.ceil()}℃",
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: WeatherColors.white,
                ),
              ),
              Text(
                widget.responseData.current.condition.text,
                style: TextStyle(
                  fontSize: 25.sp,
                  color: WeatherColors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Max: ${widget.responseData.forecast.forecastDay[0].day.maxTempC.ceil()}℃",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: WeatherColors.white,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Min: ${widget.responseData.forecast.forecastDay[0].day.minTempC.ceil()}℃",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: WeatherColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 150,
                child: Image.asset(
                  AppImages.house,
                ),
              ),
              Container(
                width: double.infinity.w,
                height: 180.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [
                      WeatherColors.blue,
                      WeatherColors.pink,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      color: WeatherColors.blue.withOpacity(0.5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: WeatherColors.white,
                            ),
                          ),
                          Text(
                            DateFormat("d, M ,y").format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: WeatherColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: WeatherColors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity.w,
                        height: 103.h,
                        child: ListView.builder(
                            itemCount: widget.responseData.forecast
                                .forecastDay[0].hour.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final day = widget.responseData.forecast
                                  .forecastDay[0].hour[index];
                              final DateTime parseDate =
                                  DateTime.parse(day.time);
                              return Column(
                                children: [
                                  Text(
                                    "${day.tempC.ceil()}℃",
                                    style: TextStyle(
                                      color: WeatherColors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                    height: 60.h,
                                    child: Image.network(
                                      "https:${day.condition.icon}",
                                    ),
                                  ),
                                  Text(
                                    DateFormat("HH:mm").format(parseDate),
                                    style: TextStyle(
                                      color: WeatherColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
