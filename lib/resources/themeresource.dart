import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';

ThemeData apptheme() {
  return ThemeData(
    scaffoldBackgroundColor: whitecolor,
    colorScheme: ColorScheme.fromSeed(seedColor: navycolor),
    useMaterial3: true,
  );
}
