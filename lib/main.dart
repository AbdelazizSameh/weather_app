import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => GetWeatherCubit(),
          child: Builder(
            builder: (context) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherData?.condition,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          ),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    // Sunny/Clear
    case 'sunny':
    case 'clear':
      return Colors.amber;

    // Partly cloudy
    case 'partly cloudy':
      return Colors.blue;

    // Cloudy/Overcast
    case 'cloudy':
    case 'overcast':
      return Colors.grey;

    // Mist/Fog
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    // Rain conditions
    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'light rain shower':
      return Colors.lightBlue;

    case 'moderate rain at times':
    case 'moderate rain':
    case 'moderate or heavy rain shower':
      return Colors.blue;

    case 'heavy rain at times':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.indigo;

    // Thunder
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;

    // Snow conditions
    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow showers':
      return Colors.blueGrey;

    case 'patchy moderate snow':
    case 'moderate snow':
    case 'moderate or heavy snow showers':
      return Colors.blueGrey;

    case 'patchy heavy snow':
    case 'heavy snow':
    case 'blowing snow':
    case 'blizzard':
      return Colors.blueGrey;

    // Sleet/Freezing conditions
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.cyan;

    // Ice pellets
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;

    // Snow with thunder
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;

    // Default
    default:
      return Colors.blue;
  }
}
