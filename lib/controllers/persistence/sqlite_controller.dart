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
    // Extract location data
    final locationData = history.weatherInfo.loc;
    final weatherInfo = history.weatherInfo; // Assuming other keys are for WeatherInfo

    // First, insert the location data
    int locationId = await database.insert(
      'GeoLocation',
      {
        'name': locationData.name,
        'latitude': locationData.lat,
        'longitude': locationData.long,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // Then, insert the weather data with the location ID
    int weatherInfoId = await database.insert(
      'WeatherInfo',
      {
        'location_id': locationId,
        'weatherCondition': weatherInfo.weatherCondition,
        'temperature': weatherInfo.temperature,
        'rainChance': weatherInfo.rainChance,
        'minDailyTemp': weatherInfo.minDailyTemp,
        'maxDailyTemp': weatherInfo.maxDailyTemp,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.insert('WeatherHistory', {
      'weatherInfo_id': weatherInfoId,
      'timestamp': history.timestamp
    });
  }
}

