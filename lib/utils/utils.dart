import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class Utils {
  Utils._();

  static String formatTime(dynamic t) {
    return DateFormat('hh:mm a')
        .format(DateFormat('HH:mm:ss').parse(t.toString()));
  }

  static String formatDate(dynamic d) {
    return DateFormat('MMM d, yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(d.toString()));
  }


  static SizedBox spacePulse({
    double height = 14,
    double width = double.infinity,
  }) {
    return SizedBox(height: height, width: width);
  }

  static EdgeInsets screenPadding({
    double horizontal = 20,
    double vertical = 5,
  }) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

}
