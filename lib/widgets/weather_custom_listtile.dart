import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/weather_image.dart';

class WeatherCustomListTile extends StatelessWidget {
  const WeatherCustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<GetWeatherCubit>(context).weatherData!;
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: SizedBox(
        height: 160.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherData.avgTemp.round().toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 130.sp,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: Text(
                    "°C",
                    style: GoogleFonts.poppins(
                      fontSize: 40.sp,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherImage(imageUrl: weatherData.imgCondition),
                Text(
                  weatherData.condition,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
