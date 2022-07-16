import 'package:flutter/material.dart';




final miTema = ThemeData.dark().copyWith(
  // accentColor esta depreciada, migro a lo siguiente
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),

);