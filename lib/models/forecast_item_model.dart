abstract class ForecastItemModel {
  final String time;
  final double avgTemp;
  final String conditionText;
  final String conditionIcon;

  ForecastItemModel({
    required this.time,
    required this.avgTemp,
    required this.conditionText,
    required this.conditionIcon,
  });

  static String convertDateStringToTime(String date)=>
       date.split(' ').last;
}

    
