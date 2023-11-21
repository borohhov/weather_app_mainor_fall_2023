import 'package:flutter/widgets.dart';
import 'package:weather_mainor_2023/controllers/history_controller.dart';
import 'package:weather_mainor_2023/entities/weather_history.dart';

class InMemoryHistoryController extends ChangeNotifier implements HistoryController {
  List<WeatherHistory> records = [];
  @override
  Future<List<WeatherHistory>> getAllRecords() async {
    return records;
  }

  @override
  Future<void> saveRecord(WeatherHistory history) async {
    records.add(history);
    notifyListeners();
  }

}