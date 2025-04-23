import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/max_min_temp_widget.dart';
import 'package:weather_app/widgets/weather_custom_listtile.dart';

class AppBarInfo extends StatelessWidget {
  const AppBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<GetWeatherCubit>(context).weatherData!;
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeatherCustomListTile(),
          MaxMinTempWidget(),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                "Updated at: ",
                style: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                weatherData.lastUpdated,
                style: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
