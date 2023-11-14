import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_mainor_2023/entities/location.dart';
import 'package:weather_mainor_2023/entities/weather_info.dart';
import 'widgets/weather_widget.dart';
import 'controllers/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  WeatherController weatherController = WeatherController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.greenAccent,
      child: Center(
        child: FutureBuilder<WeatherInfo?>(
            future: weatherController.getWeatherInfo(TALLINN_LOCATION),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text('Loading...'),
                );
              }
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                return WeatherWidget(
                  weatherInfo: snapshot.data!,
                );
              }
              return const Center(
                child: Text('Could not fetch the weather data'),
              );
            }),
      ),
    ));
  }
}
