import 'package:campuspulse/common/widgets/glass_card.dart';
import 'package:campuspulse/common/widgets/shadow_container.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ShadowContainer(
        color: PulseColors.green,
        child: GlassCard(
          child: Center(
            child: QrImageView(
              data: "https://your-website.com",
              version: QrVersions.auto,
              size: 250.0,
            ),
          ),
        ),
      ),
    );
  }
}
