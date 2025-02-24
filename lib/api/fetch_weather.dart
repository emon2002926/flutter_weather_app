
import 'dart:convert';

import 'package:flutter_weather_app/api/api_key.dart';
import 'package:flutter_weather_app/model/weather_data.dart';
import 'package:flutter_weather_app/model/weather_data_current.dart';
import 'package:flutter_weather_app/model/weather_data_hourly.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data_daily.dart';
import '../utils/api_url.dart';
class FetchWeather{
  WeatherData? weatherData;

  Future<WeatherData> prossesData( lat, lon)async{
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jasonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jasonString),
        WeatherDataHourly.fromJson(jasonString),
        WeatherDataDaily.fromJson(jasonString));
    return weatherData!;
  }

}