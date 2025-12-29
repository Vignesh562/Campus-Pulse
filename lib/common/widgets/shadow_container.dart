import 'package:flutter/material.dart';
import '../../utils/constants/pulse_colors.dart';

class ShadowContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const ShadowContainer({
    super.key,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color:  color?.withAlpha(100) ?? PulseColors.blue.withAlpha(100),
            blurRadius: 100,
            spreadRadius: 1
          ),
        ],
      ),
      child: child,
    );
  }
}
