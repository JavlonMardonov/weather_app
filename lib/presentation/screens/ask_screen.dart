import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/logic/repositories/repository.dart';
import 'package:weather_app/presentation/screens/weather_screen.dart';
import 'package:weather_app/utils/weather_colors.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({super.key});

  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  Repository repo = Repository();

  @override
  void dispose() {
    nameController.dispose();

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
              SizedBox(height: 120.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: WeatherColors.white,
                    hintText: "Write city name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final data = await repo.getData(
                    cityName: nameController.text.trim(),
                  );
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => WeatherScreen(
                        responseData: data,
                      ),
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
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: WeatherColors.white,
                        )
                      : Text(
                          "Show Info",
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
