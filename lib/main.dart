import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_mainor_2023/controllers/in_memory_history_controller.dart';
import 'package:weather_mainor_2023/screens/weather_history_screen.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => InMemoryHistoryController(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Weather App',
      routes: {
        '/': (context) => HomeScreen(),
        '/history': (context) => WeatherHistoryScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
