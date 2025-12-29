import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final double? width;
  final Widget child;

  const GlassCard({
    super.key,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          // height: height ?? double.infinity,
          // width: width ?? double.infinity,
          padding: const EdgeInsets.all(10), // 🔑 content controls height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),

            // 🌊 Liquid glass gradient
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withAlpha(12),
                Colors.white.withAlpha(3),
              ],
            ),

            // 🧊 Glass border
            border: Border.all(
              color: Colors.white.withAlpha(25),
              width: 1.2,
            ),

            // ✨ Soft glow
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(4),
                blurRadius: 30,
                spreadRadius: 1,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
