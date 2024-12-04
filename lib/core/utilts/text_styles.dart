import 'package:factory_method_pattern_with_clean_architecture/core/utilts/colors.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/fontSizer.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Static text styles for different headings and body text
  static TextStyle headLine1 = TextStyle(
    fontSize: FontSizer.s32, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.bold,
    color: AppColors.textColor, // Using color from AppColors
  );

  static TextStyle headLine2 = TextStyle(
    fontSize: FontSizer.s28, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.bold,
    color: AppColors.textColor, // Using color from AppColors
  );

  static TextStyle headLine2Yellow = TextStyle(
    fontSize: FontSizer.s28, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.bold,
    color: AppColors.warning2Color, // Yellow color from AppColors
  );

  static TextStyle headLine3 = TextStyle(
    fontSize: FontSizer.s24, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.bold,
    color: AppColors.textColor, // Using color from AppColors
  );

  static TextStyle normal = TextStyle(
    fontSize: FontSizer.s16, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.normal,
    color: AppColors.textColor, // Using color from AppColors
  );

  static TextStyle small = TextStyle(
    fontSize: FontSizer.s12, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor, // Using color from AppColors for small text
  );

  static TextStyle smallYellow = TextStyle(
    fontSize: FontSizer.s12, // Using FontSizer for dynamic scaling
    fontWeight: FontWeight.normal,
    color: AppColors.warningColor, // Yellow color from AppColors
  );
  static const TextStyle inputStyle1 = TextStyle(
    fontSize: 21.0, // Larger font size
    fontWeight: FontWeight.bold,
    color: AppColors.textColor, // Dark color
  );

  static const TextStyle inputStyle2 = TextStyle(
    fontSize: 14.0, // Smaller font size
    color: AppColors.accentColor, // Lighter color (e.g., gray)
  );
}
