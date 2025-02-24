import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/global_controller.dart';
import 'package:flutter_weather_app/model/weather_data_daily.dart';
import 'package:flutter_weather_app/utils/app_colors.dart';
import 'package:flutter_weather_app/widgets/comfort_level.dart';
import 'package:flutter_weather_app/widgets/daily_data_forecast.dart';
import 'package:flutter_weather_app/widgets/header_widgets.dart';
import 'package:flutter_weather_app/widgets/hourly_data_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_weather_app/widgets/current_weather_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Remove 'const' from here
      body: SafeArea(
        child: Obx(
              () => globalController.checkLoading().isTrue
              ? Center(child: CircularProgressIndicator())
              : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children:  [
                    SizedBox(height: 20,),
                     HeaderWidgets(),
                    CurrentWeatherWidget(
                        weatherDataCurrent:globalController.getWeatherData().getCurrentWeather()),
                    SizedBox(height: 20,),
                    HourlyDataWidget(
                        weatherDataHourly: globalController.getWeatherData().getHourlyWeather()),
                    DailyDataForecast(weatherDataDaily: globalController.getWeatherData().getDailyWeather()),
                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComfortLevel(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather())
                  ]
                ),
              ),
        ),
      ),
    );
  }
}
