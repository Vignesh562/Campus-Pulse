import 'dart:ui';
import 'package:flutter/material.dart';

Widget glass({
  required Widget child,
  BorderRadiusGeometry borderRadius = BorderRadius.zero,
  EdgeInsets padding = const EdgeInsets.all(14),
  BoxShape shape = BoxShape.rectangle,
}) {
  return ClipRRect(
    borderRadius:
    shape == BoxShape.circle ? BorderRadius.circular(999) : borderRadius,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          shape: shape,
          borderRadius:
          shape == BoxShape.circle ? BorderRadius.circular(999) : borderRadius,
          color: Colors.white.withOpacity(0.08),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
          ),
        ),
        child: child,
      ),
    ),
  );
}
