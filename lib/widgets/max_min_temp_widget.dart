import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/max_min_temp_data.dart';

class MaxMinTempWidget extends StatelessWidget {
  const MaxMinTempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<GetWeatherCubit>(context).weatherData!;
    return Container(
      width: 150.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.w),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaxMinTempData(
            icon: Icons.arrow_upward_outlined,
            temp: weatherData.maxTemp.round().toString(),
          ),
          MaxMinTempData(
            icon: Icons.arrow_downward_outlined,
            temp: weatherData.minTemp.round().toString(),
          ),
        ],
      ),
    );
  }
}
