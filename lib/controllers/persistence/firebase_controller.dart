import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_mainor_2023/controllers/history_controller.dart';
import 'package:weather_mainor_2023/entities/weather_history.dart';

import '../../firebase_options.dart';

class FirebaseController implements HistoryController {
  late FirebaseFirestore db;
  @override
  Future<List<WeatherHistory>> getAllRecords() async {
    await init();
    var snapshot = (await db.collection('weatherHistory').get()).docs;
    var records = snapshot.map((history) => WeatherHistory.fromMap(history.data())).toList();
    return records;
  }

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    db = FirebaseFirestore.instance;

  }

  @override
  Future<void> saveRecord(WeatherHistory history) async {
    await init();
    db.collection('weatherHistory').add(history.toMap());
  }

}