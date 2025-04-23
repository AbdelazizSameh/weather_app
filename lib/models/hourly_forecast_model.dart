import 'package:weather_app/models/forecast_item_model.dart';

class HourlyForecastModel extends ForecastItemModel {
  HourlyForecastModel({
    required super.time,
    required super.avgTemp,
    required super.conditionText,
    required super.conditionIcon,
  });

  factory HourlyForecastModel.fromJson(json) {
   
    return HourlyForecastModel(
      time: ForecastItemModel.convertDateStringToTime(json['time']),
      avgTemp: json['temp_c'],
      conditionText: json['condition']['text'],
      conditionIcon: json['condition']['icon'],
    );
  }
}
