import 'package:weather_mainor_2023/entities/location.dart';

import '../entities/weather_info.dart';
import '../services/weather_backend_calls.dart';
class WeatherController{

  Future<WeatherInfo?> getWeatherInfo(GeoLocation location){
    return fetchWeatherData(location);

    // return WeatherInfo("Windy", 20, 1, 1, 20);
  }
}