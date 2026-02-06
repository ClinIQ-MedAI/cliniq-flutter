import 'package:cliniq/core/utils/app_input_theme.dart';
import 'package:cliniq/core/utils/text_palette.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class AppTheme {
  /// ----------------- Light Theme -----------------
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    // Core Colors
    primaryColor: AppLightColors.primary,
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    dividerColor: AppLightColors.onSurfaceSecondary,
    disabledColor: AppLightColors.disabledColor,

    // Icon Theme
    iconTheme: const IconThemeData(color: AppLightColors.onSurface),

    // Color Scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondary,
      onSecondary: AppLightColors.onSecondary,
      error: AppLightColors.error,
      onError: AppLightColors.onError,
      surface: AppLightColors.backgroundColor,
      onSurface: AppLightColors.onBackground,
      onSurfaceVariant: AppLightColors.onSurfaceVariant,
      outline: AppLightColors.outline,
      primaryContainer: AppLightColors.primaryContainer,
      onPrimaryContainer: AppLightColors.onPrimaryContainer,
      surfaceContainerHigh: AppLightColors.surfaceContainerHigh,
      surfaceContainerLow: AppLightColors.surfaceContainerLow,
    ),

    // TextPalette & TextField Extensions
    extensions: [
      TextPalette(
        primaryColor: AppLightColors.primaryText,
        secondaryColor: AppLightColors.secondaryText,
        paragraphColor: AppLightColors.tertiaryText,
        helperColor: AppLightColors.helperText,
        headingColor: AppLightColors.subLabelText,
        labelColor: AppLightColors.labelText,
        alertColor: AppLightColors.alertText,
      ),
      AppInputTheme(
        backgroundColor: AppLightColors.inputLightBackground,
        highLightBackgroundColor: AppLightColors.inputHighLightBackground,
        borderColor: AppLightColors.inputBorderColor,
        focusedBorderColor: AppLightColors.inputFocusedBorderColor,
        disabledBackgroundColor: AppLightColors.inputDisabledBackgroundColor,
        errorBorderColor: AppLightColors.inputErrorBorderColor,
        textColor: AppLightColors.inputTextColor,
        hintColor: AppLightColors.inputHintColor,
        iconColor: AppLightColors.inputIconColor,
      ),
    ],

    // Input Decorations
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppLightColors.inputIconColor,
      suffixIconColor: AppLightColors.inputIconColor,
      labelStyle: AppTextStyles.getTextStyle(
        14,
      ).copyWith(color: AppLightColors.inputTextColor),
      hintStyle: AppTextStyles.getTextStyle(
        14,
      ).copyWith(color: AppLightColors.inputHintColor),
      errorStyle: AppTextStyles.getTextStyle(
        12,
      ).copyWith(color: AppLightColors.error),
    ),

    // SnackBar Theme
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppLightColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  /// ----------------- Dark Theme -----------------
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    // Core Colors
    primaryColor: AppDarkColors.primary,
    scaffoldBackgroundColor: AppDarkColors.backgroundColor,
    dividerColor: AppDarkColors.onSurfaceSecondary,
    cardColor: AppDarkColors.surfaceContainerHigh,
    disabledColor: AppDarkColors.disabledColor,

    // Icon Theme
    iconTheme: const IconThemeData(color: AppDarkColors.onSurface),

    // Color Scheme
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      onSecondary: AppDarkColors.onSecondary,
      error: AppDarkColors.error,
      onError: AppDarkColors.onError,
      surface: AppDarkColors.backgroundColor,
      onSurface: AppDarkColors.onBackground,
      onSurfaceVariant: AppDarkColors.onSurfaceVariant,
      outline: AppDarkColors.outline,
      primaryContainer: AppDarkColors.primaryContainer,
      onPrimaryContainer: AppDarkColors.onPrimaryContainer,
      surfaceContainerHigh: AppDarkColors.surfaceContainerHigh,
      surfaceContainerLow: AppDarkColors.surfaceContainerLow,
    ),

    // TextPalette & TextField Extensions
    extensions: [
      TextPalette(
        primaryColor: AppDarkColors.primaryText,
        secondaryColor: AppDarkColors.secondaryText,
        paragraphColor: AppDarkColors.tertiaryText,
        helperColor: AppDarkColors.helperText,
        headingColor: AppDarkColors.subLabelText,
        labelColor: AppDarkColors.labelText,
        alertColor: AppDarkColors.alertText,
      ),
      AppInputTheme(
        backgroundColor: AppDarkColors.inputLightBackground,
        highLightBackgroundColor: AppDarkColors.inputHighLightBackground,
        borderColor: AppDarkColors.inputBorderColor,
        focusedBorderColor: AppDarkColors.inputFocusedBorderColor,
        disabledBackgroundColor: AppDarkColors.inputDisabledBackgroundColor,
        errorBorderColor: AppDarkColors.inputErrorBorderColor,
        textColor: AppDarkColors.inputTextColor,
        hintColor: AppDarkColors.inputHintColor,
        iconColor: AppDarkColors.inputIconColor,
      ),
    ],

    // Input Decorations
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppDarkColors.onSurfaceVariantLight,
      labelStyle: AppTextStyles.getTextStyle(
        14,
      ).copyWith(color: AppDarkColors.inputTextColor),
      hintStyle: AppTextStyles.getTextStyle(
        14,
      ).copyWith(color: AppDarkColors.inputHintColor),
      errorStyle: AppTextStyles.getTextStyle(
        12,
      ).copyWith(color: AppDarkColors.error),
    ),

    // SnackBar Theme
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppDarkColors.primary,
      contentTextStyle: TextStyle(color: Colors.white),
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
