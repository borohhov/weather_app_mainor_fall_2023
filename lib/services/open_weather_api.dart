import 'package:http/http.dart' as http;
import 'package:weather_mainor_2023/entities/location.dart';
import 'dart:convert';

import '../entities/weather_info.dart';

Future<WeatherInfo?> fetchWeatherData(GeoLocation location) async {
  var url = Uri.parse('https://api.open-meteo.com/v1/forecast')
      .replace(queryParameters: {
    'latitude': location.lat.toString(),
    'longitude': location.long.toString(),
    'hourly': 'temperature_2m,precipitation,weather_code',
    'daily': 'temperature_2m_max,temperature_2m_min,precipitation_probability_max',
    'timezone': 'auto',
    'forecast_days': '1',
  });

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      // Extracting data from API response
      var hourlyWeather = data['hourly'];
      var dailyWeather = data['daily'];

      // Assuming we are interested in the current hour's weather
      double temperature = hourlyWeather['temperature_2m'][0];
      String? weatherCondition = weatherCodeDescriptions[hourlyWeather['weather_code'][0]];
      int rainChance = dailyWeather['precipitation_probability_max'][0];
      double minDailyTemp = dailyWeather['temperature_2m_min'][0];
      double maxDailyTemp = dailyWeather['temperature_2m_max'][0];

      return WeatherInfo(location, weatherCondition ?? 'Unknown', temperature, rainChance, minDailyTemp, maxDailyTemp);
    } else {
      print('Failed to load weather data');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}