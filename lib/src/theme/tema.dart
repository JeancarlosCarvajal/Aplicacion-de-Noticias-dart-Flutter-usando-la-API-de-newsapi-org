import 'package:flutter/material.dart';




class AppTheme {
  static const Color primary = Colors.red; 
}


final miTema = ThemeData.dark().copyWith(
  // accentColor esta depreciada, migro a lo siguiente
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppTheme.primary),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppTheme.primary
  )

);