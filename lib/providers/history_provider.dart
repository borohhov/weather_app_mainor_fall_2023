import 'package:flutter/widgets.dart';
import 'package:weather_mainor_2023/controllers/history_controller.dart';
import 'package:weather_mainor_2023/controllers/persistence/firebase_controller.dart';
import 'package:weather_mainor_2023/controllers/persistence/sqlite_controller.dart';
import 'package:weather_mainor_2023/entities/weather_history.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryController controller = FirebaseController();


  Future<List<WeatherHistory>> getAllRecords() async {
    controller.init();
    return controller.getAllRecords();
  }

  Future<void> saveRecord(WeatherHistory history) async {
    controller.saveRecord(history);
    notifyListeners();
  }
}