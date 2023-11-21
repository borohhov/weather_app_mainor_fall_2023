import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_mainor_2023/controllers/in_memory_history_controller.dart';
import 'package:weather_mainor_2023/entities/location.dart';
import 'package:weather_mainor_2023/entities/weather_history.dart';
import 'package:weather_mainor_2023/entities/weather_info.dart';
import '../widgets/weather_widget.dart';
import '../controllers/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  WeatherController weatherController = WeatherController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/history'),
          child: Icon(Icons.schedule_sharp),
        ),
        body: Container(
          color: Colors.greenAccent,
          child: Center(
            child: RefreshIndicator(
              onRefresh: () async {
                await weatherController.getWeatherInfo(TALLINN_LOCATION);
                setState(() {});
              },
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
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        WeatherHistory history = WeatherHistory(snapshot.data!, DateTime.now());
                        Provider.of<InMemoryHistoryController>(context, listen: false).saveRecord(history);
                      });
                      return ListView(
                        children: [
                          WeatherWidget(
                            weatherInfo: snapshot.data!,
                          )
                        ],
                      );
                    }
                    return const Center(
                      child: Text('Could not fetch the weather data'),
                    );
                  }),
            ),
          ),
        ));
  }
}
