import 'package:flutter/material.dart';

const MaterialColor NordMain = MaterialColor(_nordPrimaryValue, <int, Color>{
  50: Color(0xFFE6E7E8),
  100: Color(0xFFC0C2C6),
  200: Color(0xFF979AA0),
  300: Color(0xFF6D7179),
  400: Color(0xFF4D525D),
  500: Color(_nordPrimaryValue),
  600: Color(0xFF292F3A),
  700: Color(0xFF232732),
  800: Color(0xFF1D212A),
  900: Color(0xFF12151C),
});
const int _nordPrimaryValue = 0xFF2E3440;

const MaterialColor nordAccent = MaterialColor(_nordAccentValue, <int, Color>{
  100: Color(0xFF6188FF),
  200: Color(_nordAccentValue),
  400: Color(0xFF003EFA),
  700: Color(0xFF0038E0),
});
const int _nordAccentValue = 0xFF2E62FF;
