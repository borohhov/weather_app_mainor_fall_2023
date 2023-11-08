import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: Center(child: WeatherWidget(weatherInfo: weatherController.getWeatherInfo(),),),
      ),
    );
  }
}

