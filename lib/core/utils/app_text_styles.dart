import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static TextStyle getTextStyle(
    double fontSize, {
    String fontFamily = AppFonts.poppins,
  }) {
    switch (fontFamily) {
      case AppFonts.cairo:
        return GoogleFonts.cairo(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w400,
        );

      case AppFonts.poppins:
        return GoogleFonts.poppins(
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w400,
        );

      default:
        return TextStyle(fontFamily: fontFamily, fontSize: fontSize);
    }
  }
}
