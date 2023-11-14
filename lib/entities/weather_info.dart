import 'package:weather_mainor_2023/entities/location.dart';

class WeatherInfo {
  GeoLocation loc;
  String weatherCondition;
  double temperature;
  int rainChance;
  double minDailyTemp;
  double maxDailyTemp;

  WeatherInfo(this.loc, this.weatherCondition, this.temperature, this.rainChance, this.minDailyTemp,this.maxDailyTemp);

}

Map<int, String> weatherCodeDescriptions = {
  0: 'Clear Sky',
  1: 'Partly Cloudy',
  2: 'Cloudy',
  3: 'Partly Cloudy',
  45: 'Fog',
  48: 'Rime Fog',
  51: 'Light Drizzle',
  53: 'Moderate Drizzle',
  55: 'Dense Drizzle',
  56: 'Freezing Drizzle',
  57: 'Dense Freezing',
  61: 'Slight Rain',
  63: 'Moderate Rain',
  65: 'Heavy Rain',
  66: 'Light Freezing',
  67: 'Heavy Freezing',
  71: 'Slight Snow',
  73: 'Moderate Snow',
  75: 'Heavy Snow',
  77: 'Snow Grains',
  80: 'Slight Showers',
  81: 'Moderate Showers',
  82: 'Violent Showers',
  85: 'Slight Snowfall',
  86: 'Heavy Snowfall',
  95: 'Thunderstorm',
  96: 'Light Hail',
  99: 'Heavy Hail',
};


