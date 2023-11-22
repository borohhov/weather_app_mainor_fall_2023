import 'package:weather_mainor_2023/entities/weather_info.dart';

class WeatherHistory {
  WeatherInfo weatherInfo;
  DateTime timestamp;

  WeatherHistory(this.weatherInfo, this.timestamp);
  Map<String, dynamic> toMap() {
    return {
      'weatherInfo': weatherInfo.toMap(),
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static WeatherHistory fromMap(Map<String, dynamic> map) {
    return WeatherHistory(
      WeatherInfo.fromMap(map['weatherInfo']),
      DateTime.parse(map['timestamp']),
    );
  }
}