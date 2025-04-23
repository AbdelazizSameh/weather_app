import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MaxMinTempData extends StatelessWidget {
  const MaxMinTempData({super.key, required this.icon, required this.temp});
  final IconData icon;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 23.h),
        Text(
          "$temp°",
          style: GoogleFonts.poppins(fontSize: 15.sp, color: Colors.white),
        ),
      ],
    );
  }
}
