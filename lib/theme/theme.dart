import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xff582FFE),
    brightness: Brightness.dark,
    primary: Color(0xff582FFE),
    secondary: Color(0xff1D1F24),
    outline: Colors.white,
    inverseSurface: Colors.grey,
    surfaceVariant: Color(0xff383C46),
    background: Color(0xff131417),
    onBackground: Color(0xff585F6F),
    onTertiary: Color(0xff646464),
    secondaryContainer: Color(0xff2B2D33),
    tertiaryContainer: Color(0xFF32363F),
    scrim: Color(0xffFFD700),
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 11,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    displaySmall: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    displayMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    displayLarge: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 25,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Color(0xff1D1F24),
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
  ),
);
