import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray300,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.blueGray90001,
          fontSize: 16.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.indigo300,
          fontSize: 14.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 34.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 30.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700.withOpacity(0.57),
          fontSize: 20.fSize,
          fontFamily: 'Source Sans Pro',
          fontWeight: FontWeight.w400,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF7292CF),
    primaryContainer: Color(0XFF003849),
    secondaryContainer: Color(0XFFA5A5A5),

    // Error colors
    errorContainer: Color(0XFF345FB4),

    // On colors(text colors)
    onPrimary: Color(0XFF0905F2),
    onPrimaryContainer: Color(0XFFF5F6FC),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber300 => Color(0XFFFFD348);
  Color get amber30001 => Color(0XFFFFD066);

  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFC6CBD4);
  Color get blueGray900 => Color(0XFF313131);
  Color get blueGray90001 => Color(0XFF323643);

  // Gray
  Color get gray100 => Color(0XFFF2F2F2);
  Color get gray300 => Color(0XFFE1E3E8);
  Color get gray600 => Color(0XFF777777);
  Color get gray60001 => Color(0XFF707070);
  Color get gray800 => Color(0XFF3A3A3A);

  // Indigo
  Color get indigo300 => Color(0XFF6184C7);
  Color get indigo600 => Color(0XFF2855AE);
  Color get indigoA700 => Color(0XFF1F41F2);

  // Red
  Color get red300 => Color(0XFFD67676);

  // Teal
  Color get teal200 => Color(0XFF90CCD6);
  Color get teal300 => Color(0XFF5596A5);
  Color get teal400 => Color(0XFF4094A8);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
