import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/presentation/widgets/custom_cub.dart';
import 'package:weather_app/utils/weather_colors.dart';
import 'package:weather_app/utils/weather_images.dart';
import 'package:weather_app/utils/weather_textstyle.dart';

class DailyScreen extends StatefulWidget {
  final WeatherResponse responseData;
  const DailyScreen({required this.responseData, super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: WeatherColors.white,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: Boldtext(
                    color: WeatherColors.white,
                    fontSize: 30,
                    text: widget.responseData.location.name,
                  ),
                ),
                Center(
                  child: NormalText(
                    color: WeatherColors.white,
                    fontSize: 24,
                    text:
                        "Max: ${widget.responseData.forecast.forecastDay[0].day.maxTempC.ceil()}℃    Min: ${widget.responseData.forecast.forecastDay[0].day.minTempC.ceil()}℃",
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Boldtext(
                    text: "   7-Days Forecasts",
                    fontSize: 24,
                    color: WeatherColors.white),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400.w,
                  height: 172.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          widget.responseData.forecast.forecastDay.length,
                      itemBuilder: (context, index) {
                        final day =
                            widget.responseData.forecast.forecastDay[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 172.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                50.r,
                              ),
                              gradient: index == 0
                                  ? LinearGradient(
                                      colors: [
                                        WeatherColors.lightBlue,
                                        WeatherColors.pink
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff3d2c8e),
                                        Color(0xff8d78c7)
                                      ],
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NormalText(
                                    text:
                                        "${((day.day.minTempC + day.day.maxTempC) ~/ 2).toString()}℃",
                                    fontSize: 20,
                                    color: WeatherColors.white,
                                  ),
                                  SizedBox(
                                    height: 60.h,
                                    width: 60.w,
                                    child: Image.network(
                                        "https:${day.day.condition.icon}"),
                                  ),
                                  NormalText(
                                    text: DateFormat("E")
                                        .format(DateTime.parse(day.date)),
                                    fontSize: 20,
                                    color: WeatherColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  width: 352.w,
                  height: 174.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      colors: [
                        WeatherColors.lightBlue,
                        WeatherColors.pink,
                        WeatherColors.lightPurple,
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.air),
                            SizedBox(
                              width: 10.w,
                            ),
                            NormalText(
                                text: "AIR QUALITY",
                                fontSize: 12.sp,
                                color: WeatherColors.white),
                          ],
                        ),
                        Boldtext(
                            text: "3-Low Health Risk",
                            fontSize: 24,
                            color: WeatherColors.white),
                        Spacer(),
                        Divider(
                          thickness: 6,
                          color: WeatherColors.lightPurple,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalText(
                                text: "See More",
                                fontSize: 18,
                                color: WeatherColors.white),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: WeatherColors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CutomCube(
                      title: "SUNRISE",
                      imagePath: AppImages.star,
                      time: "5:28 AM",
                      sunset: "Sunset: 7:25 AM",
                      fontSize: 16,
                      fontSize1: 22,
                    ),
                    CutomCube(
                      title: "UV INDEX",
                      imagePath: AppImages.star,
                      time: "4",
                      sunset: "Moderate",
                      fontSize: 16,
                      fontSize1: 22,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
