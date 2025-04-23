import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather =
        BlocProvider.of<GetWeatherCubit>(context).weatherData;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weather?.condition)[600]!,
              getThemeColor(weather?.condition)[300]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Search City',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Search Illustration
                      Icon(
                        Icons.search_rounded,
                        size: 70.sp,
                        color: Colors.white70,
                      ),
                      SizedBox(height: 40.h),

                      // Search Field
                      Container(
                        decoration: BoxDecoration(
                          color: getThemeColor(weather?.condition).withValues(
                            alpha: 0.2,
                            blue: 0.4,
                            green: 0.4,
                            red: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: TextField(
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                          onSubmitted: (value) async {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                            );
                            var weaherModel = BlocProvider.of<GetWeatherCubit>(
                              context,
                            );
                            await weaherModel.getWeather(cityName: value);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter city name...',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white70,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 25.w,
                              vertical: 18.h,
                            ),
                            suffixIcon: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: getThemeColor(weather?.condition)[800],
                                  size: 24.sp,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
