import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final bool showRetry;
  final VoidCallback onSearchPressed;
  final VoidCallback? onRetryPressed;

  const WeatherStateWidget({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.onSearchPressed,
    this.showRetry = false,
    this.onRetryPressed,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather =
        BlocProvider.of<GetWeatherCubit>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: GoogleFonts.poppins(fontSize: 18.sp, color: Colors.white),
        ),
        backgroundColor: getThemeColor(weather?.condition)[600],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: onSearchPressed,
            icon: Icon(Icons.search_rounded, color: Colors.white, size: 28.sp),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [Colors.blue.shade600, Colors.lightBlue.shade200],
            colors: [
              getThemeColor(weather?.condition)[600]!,
              getThemeColor(weather?.condition)[300]!,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 120.sp, color: Colors.white.withOpacity(0.8)),
                SizedBox(height: 30.h),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 40.h),
                if (showRetry && onRetryPressed != null) _buildRetryButton(),
                _buildSearchButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return ElevatedButton(
      onPressed: onSearchPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade800,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search, size: 24.sp),
          SizedBox(width: 10.w),
          Text(
            'Search City',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRetryButton() {
    return ElevatedButton(
      onPressed: onRetryPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade800,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.refresh, size: 24.sp),
          SizedBox(width: 10.w),
          Text(
            'Try Again',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
