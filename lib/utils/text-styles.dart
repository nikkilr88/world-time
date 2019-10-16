import 'package:flutter/material.dart';

TextStyle setTextStyle(double fontSize, FontWeight fontWeight, bool isDaytime) {
  return TextStyle(
    color: isDaytime ? Colors.grey[800] : Colors.white,
    fontSize: fontSize,
    fontWeight: fontWeight,
    shadows: [
      Shadow(
        blurRadius: 8.0,
        color: isDaytime ? Colors.transparent : Colors.black54,
        offset: Offset(0.0, 2.0),
      ),
    ],
  );
}
