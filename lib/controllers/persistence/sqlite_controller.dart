import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_mainor_2023/controllers/history_controller.dart';
import 'package:weather_mainor_2023/controllers/persistence/create_tables_command.dart';
import 'package:weather_mainor_2023/entities/weather_history.dart';

class SQLiteController implements HistoryController {
  late Database database;

  @override
  Future<void> init() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'weather_database.db'),
      onCreate: (db, version) {
        return db.execute(createTable);
      },
      version: 1,
    );
  }

  @override
  Future<List<WeatherHistory>> getAllRecords() async {
    await init();
    final List<Map<String, dynamic>> maps =
        await database.query('WeatherHistory');

    List<WeatherHistory> list =
        maps.map((m) => WeatherHistory.fromMap(m)).toList();

    return list;
  }

  @override
  Future<void> saveRecord(WeatherHistory history) async {
    await init();
    await database.insert(
      'WeatherHistory',
      history.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
