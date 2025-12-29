import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:flutter/material.dart';

abstract class PulseText {
  PulseText._();

  static final TextStyle heading = TextStyle(
    color: PulseColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 34,
  );

  static const TextStyle txt = TextStyle(
    color: PulseColors.primary,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static const TextStyle btnTxt = TextStyle(
    color: PulseColors.primary,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );


  // static const TextStyle separation = TextStyle(
  //   color: PulseColors.primary,
  //   fontWeight: FontWeight.w500,
  //   fontSize: 18,
  // );


  static const TextStyle label = TextStyle(
    color: PulseColors.primary,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle title = TextStyle(
    color: PulseColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle body = TextStyle(
    color: PulseColors.primary,
    fontSize: 14,
  );

  static const TextStyle bodyLight = TextStyle(
    color: PulseColors.primaryLight,
    fontSize: 14,
  );


  static const String onboarding1title = "Welcome to Campus Pulse";
  static const String onboarding1description =  'Your ultimate guide to what\'s happening on campus. From study groups to concerts & party, find your crown today with friends.';



  static const String onboarding2title = "Weekend Vibes Party Zone";
  static const String onboarding2description  = "Explore events, meet new people, and make every weekend unforgettable. Create lasting memories. Celebrate life together.";


  static const String onboarding3title = "Connect With Your Campus";
  static const String onboarding3description  = "Stay updated, join groups, and build meaningful connections with students around you in campus. Share exciting adventures";

}
