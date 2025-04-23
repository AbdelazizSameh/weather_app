import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/daily_forecast_model.dart';
import 'package:weather_app/widgets/weather_image.dart';

class TomorrowListTile extends StatelessWidget {
  const TomorrowListTile({super.key, required this.tomorrow});

  final DailyForecastModel tomorrow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFF9F9F9),
        radius: 25.w,
        child: WeatherImage(imageUrl: tomorrow.conditionIcon),
      ),
      title: Text(
        "Tomorrow",
        style: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        tomorrow.conditionText,
        style: GoogleFonts.poppins(fontSize: 14.sp),
      ),
      trailing: Text(
        '${tomorrow.avgTemp.round().toString()}°',
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
