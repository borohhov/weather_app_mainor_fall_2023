import 'package:flutter/cupertino.dart';
import '../entities/weather_info.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({super.key, required this.weatherInfo});

  WeatherInfo weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, bottom: 60),
          child: Column(
            children: [
              Text(
                '${weatherInfo.weatherCondition } in ${weatherInfo.loc.name}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              Text(
                '${weatherInfo.temperature}°C',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Text(
          'Next 24h:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Text(
          'Rain chance ${weatherInfo.rainChance}%',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Text(
          'Min ${weatherInfo.minDailyTemp}°C, Max ${weatherInfo.maxDailyTemp}°C',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
