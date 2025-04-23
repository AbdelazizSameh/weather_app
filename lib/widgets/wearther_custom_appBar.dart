import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/appBar_background.dart';

class WeartherAppBar extends StatelessWidget {
  const WeartherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherData =
        BlocProvider.of<GetWeatherCubit>(context).weatherData!;
    return SliverAppBar(
      backgroundColor: getThemeColor(weatherData.condition)[600],
      collapsedHeight: 60.h,
      pinned: true,
      expandedHeight: 350.h,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 10.w, bottom: 30.h),
        title: Row(
          children: [
            Icon(Icons.location_on_rounded, size: 22.h, color: Colors.white),
            SizedBox(width: 6.w),
            Text(
              weatherData.location,
              style: GoogleFonts.poppins(fontSize: 20.sp, color: Colors.white),
            ),
          ],
        ),
        stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
        background: AppBarBackground(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchView()),
            );
          },
          icon: Icon(Icons.search_rounded, color: Colors.white, size: 25.h),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(
          height: 23.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
        ),
      ),
    );
  }
}
