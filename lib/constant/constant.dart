import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


// Height

var spacer5Height = SizedBox(height: 0.6.h);
var spacer10Height = SizedBox(height: 1.2.h);
var spacer20Height = SizedBox(height: 2.5.h);
var spacer30Height = SizedBox(height: 3.5.h);
var spacer40Height = SizedBox(height: 4.6.h);
var spacer50Height = SizedBox(height: 6.h);

// Width

var spacer2WidthD = SizedBox(width: 2.5.w);
var spacer5WidthD = SizedBox(width: 5.w);
var spacer10WidthD = SizedBox(width: 10.w);
var spacer20WidthD = SizedBox(width: 20.w);
var spacer30WidthD = SizedBox(width: 30.w);
var spacer40WidthD = SizedBox(width: 40.w);
var spacer50WidthD = SizedBox(width: 50.w);


// Youtube video extract function

extractYouTubeId(url) {
  final regExp = RegExp(
    r'(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
    caseSensitive: false,
  );
  final match = regExp.firstMatch(url);
  return match?.group(1);
}

/// theme data


ThemeData dark = ThemeData(
  fontFamily: "Poppins",
  primaryColor: const Color(0xFF3E3BEE),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  cardColor: const Color(0xFF252525),
  hintColor: const Color(0xFFE7F6F8),
  // bottomAppBarColor: const Color(0xff1F1D2A),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white,
  ),
  focusColor: const Color(0xFFADC4C8),
  cardTheme: const CardTheme(color: const Color(0xFF252525)),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    // color: Colors.grey[900],
    color: const Color(0xFF2C2C2C), elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.inter(
      // fontFamily: 'Poppins',
      fontSize: 16,
      letterSpacing: -0.6,
      wordSpacing: 1,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),

  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: Colors.white,
    textStyle: GoogleFonts.inter(color: Colors.white),
  )),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.inter(color: const Color(0xFF252525)),
    displayLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    displayMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    displaySmall: GoogleFonts.inter(
        fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headlineSmall: GoogleFonts.inter(
        fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w800, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    bodySmall: GoogleFonts.inter(
        fontWeight: FontWeight.w900, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    titleMedium: GoogleFonts.inter(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.inter(fontSize: 12.0),
    bodyLarge: GoogleFonts.inter(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);

class Dimensions {
  static const double FONT_SIZE_EXTRA_SMALL = 10.0;
  static const double FONT_SIZE_SMALL = 12.0;
  static const double FONT_SIZE_DEFAULT = 14.0;
  static const double FONT_SIZE_LARGE = 16.0;
  static const double FONT_SIZE_EXTRA_LARGE = 18.0;
  static const double FONT_SIZE_OVER_LARGE = 24.0;
  static const double FONT_SIZE_THIRTY = 30.0;

  static const double PADDING_SIZE_EXTRA_SMALL = 5.0;
  static const double PADDING_SIZE_SMALL = 10.0;
  static const double PADDING_SIZE_DEFAULT = 15.0;
  static const double PADDING_SIZE_LARGE = 20.0;
  static const double PADDING_SIZE_EXTRA_LARGE = 25.0;

  static const double RATING_HEIGHT = 8.0;

  static const double RADIUS_SIZE_SMALL = 5.0;
  static const double RADIUS_SIZE_DEFAULT = 8.0;
  static const double RADIUS_SIZE_FIFTY = 50.0;

  static const double WEB_SCREEN_WIDTH = 1170;
  static const int MESSAGE_INPUT_LENGTH = 250;
}
