import 'package:weather_app/models/daily_forecast_model.dart';
import 'package:weather_app/models/forecast_item_model.dart';
import 'package:weather_app/models/hourly_forecast_model.dart';

class WeatherModel {
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String imgCondition;
  final String lastUpdated;
  final String conditionTime;
  final String location;
  final List<HourlyForecastModel> hourlyForecast;
  final List<DailyForecastModel> dailyForecast;

  WeatherModel({
    required this.hourlyForecast,
    required this.location,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.conditionTime,
    required this.imgCondition,
    required this.lastUpdated,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson({
    required Map<String, dynamic> json,
    required int daysIndex,
  }) {
    return WeatherModel(
      location: json['location']['name'],
      avgTemp: json['forecast']['forecastday'][daysIndex]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][daysIndex]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][daysIndex]['day']['maxtemp_c'],
      condition: json['current']['condition']['text'],
      imgCondition: json['current']['condition']['icon'],
      lastUpdated: ForecastItemModel.convertDateStringToTime(
        json['current']['last_updated'],
      ),
      conditionTime: ForecastItemModel.convertDateStringToTime(
        json['location']['localtime'],
      ),
      hourlyForecast:
          (json['forecast']['forecastday'][daysIndex]['hour'] as List)
              .map((e) => HourlyForecastModel.fromJson(e))
              .toList(),
      dailyForecast:
          (json['forecast']['forecastday'] as List)
              .map((e) => DailyForecastModel.fromJson(e))
              .toList(),
    );
  }
}
