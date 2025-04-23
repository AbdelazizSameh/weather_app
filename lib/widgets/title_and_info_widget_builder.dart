import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/forecast_item_model.dart';
import 'package:weather_app/widgets/title_and_info_listView.dart';

class TitleAndInfoWidgetBuilder extends StatelessWidget {
  const TitleAndInfoWidgetBuilder({
    super.key,
    required this.title,
    required this.forecastItems,
  });

  final String title;
  final List<ForecastItemModel> forecastItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 190.h,
          child: TitleAndInfoListView(forecastItems: forecastItems),
        ),
      ],
    );
  }
}
