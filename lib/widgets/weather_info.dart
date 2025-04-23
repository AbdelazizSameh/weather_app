import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/title_and_info_widget_builder.dart';
import 'package:weather_app/widgets/tomorrow_info_section.dart';
import 'package:weather_app/widgets/wearther_custom_appBar.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<GetWeatherCubit>(context).weatherData!;
    return CustomScrollView(
      slivers: [
        WeartherAppBar(),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Colors.white,
            child: Column(
              spacing: 30.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndInfoWidgetBuilder(
                  title: 'Hourly Forecast',
                  forecastItems: weatherData.hourlyForecast,
                ),
                TomorrowInfoSection(
                  title: 'Tomorrow',
                  tomorrow: weatherData.dailyForecast[1],
                ),
                TitleAndInfoWidgetBuilder(
                  title: 'Daily Forecast',
                  forecastItems: weatherData.dailyForecast,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
