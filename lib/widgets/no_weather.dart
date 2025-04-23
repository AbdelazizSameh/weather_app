import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_state_widget.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return WeatherStateWidget(
      title: 'No Weather Data',
      message:
          'Search for a city to get current weather information and forecasts',
      icon: Icons.cloud_off_rounded,
      onSearchPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchView()),
          ),
    );
  }
}
