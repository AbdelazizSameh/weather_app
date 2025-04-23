import 'package:weather_app/models/forecast_item_model.dart';

class DailyForecastModel extends ForecastItemModel {
  DailyForecastModel({
    required super.time,
    required super.avgTemp,
    required super.conditionText,
    required super.conditionIcon,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      time: ForecastItemModel.convertDateStringToTime(json['date']),
      avgTemp: json['day']['avgtemp_c'],
      conditionText: json['day']['condition']['text'],
      conditionIcon: json['day']['condition']['icon'],
    );
  }
}
