import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/forecast_item_model.dart';
import 'package:weather_app/widgets/weather_image.dart';

class TitleAndInfoListView extends StatelessWidget {
  const TitleAndInfoListView({super.key, required this.forecastItems});

  final List<ForecastItemModel> forecastItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: forecastItems.length,

      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemBuilder: (context, index) {
        final item = forecastItems[index];
        return Container(
          width: 120.w,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.w),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFF9F9F9),
                radius: 30.r,
                child: WeatherImage(imageUrl: item.conditionIcon),
              ),
              Text(
                '${item.avgTemp.round()}°',
                style: GoogleFonts.poppins(fontSize: 16.sp),
              ),
              Text(item.time, style: GoogleFonts.poppins(fontSize: 14.sp)),
              SizedBox(
                width: 90.w,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    item.conditionText,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 12.w),
    );
  }
}
