import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xff582FFE),
    brightness: Brightness.dark,
    surface: Color(0xff582FFE),
    background: Color(0xff131417),
    primary: Color(0xff582FFE),
    secondary: Color(0xff1D1F24),
    outline: Colors.white,
    inverseSurface: Colors.grey,
    surfaceVariant: Color(0xff383C46),
    onBackground: Color(0xff585F6F),
  ),
  textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 13,
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
      )),
);
