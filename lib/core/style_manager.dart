import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSized,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontFamily: "Spirit-Of-Doha",
    fontSize: fontSized,
  );
}

TextStyle boldFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.bold,
      color,
    );
TextStyle mediumFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.medium,
      color,
    );
TextStyle regularFont({
  required double fontSized,
  required Color color,
}) =>
    _getTextStyle(
      fontSized,
      FontWeightManager.regular,
      color,
    );
