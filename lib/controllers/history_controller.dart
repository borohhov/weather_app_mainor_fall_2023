import 'package:weather_mainor_2023/entities/weather_history.dart';

abstract class HistoryController {
  Future<void> init();
  Future<void> saveRecord(WeatherHistory history);
  Future<List<WeatherHistory>> getAllRecords();
}