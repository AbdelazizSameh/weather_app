
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/daily_forecast_model.dart';
import 'package:weather_app/widgets/tomorrow_list_tile.dart';

class TomorrowInfoSection extends StatelessWidget {
  const TomorrowInfoSection({
    super.key,
    required this.title,
    required this.tomorrow,
  });
  final String title;
  final DailyForecastModel tomorrow;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30.h,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2.r,
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.h),
          child: TomorrowListTile(tomorrow: tomorrow),
        ),
      ],
    );
  }
}
