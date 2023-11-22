import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_mainor_2023/controllers/history_controller.dart';
import 'package:weather_mainor_2023/providers/history_provider.dart';

class WeatherHistoryScreen extends StatelessWidget {
  const WeatherHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather History'),
        ),
        body: FutureBuilder(
          future: Provider.of<HistoryProvider>(context).getAllRecords(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView(
                children: snapshot.data!
                    .map((record) => Text(
                        '${record.weatherInfo.temperature} ${record.weatherInfo.weatherCondition} ${record.timestamp.toString()}'))
                    .toList(),
              );
            }
            return Text('No records');
          },
        ));
  }
}
