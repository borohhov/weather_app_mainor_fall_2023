import 'package:weather_mainor_2023/entities/weather_info.dart';

class WeatherHistory {
  WeatherInfo weatherInfo;
  DateTime timestamp;

  WeatherHistory(this.weatherInfo, this.timestamp);
}