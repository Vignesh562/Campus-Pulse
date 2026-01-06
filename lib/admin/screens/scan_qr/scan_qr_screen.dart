import 'package:campuspulse/common/widgets/glass_card.dart';
import 'package:campuspulse/common/widgets/pulse_appbar.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../utils/constants/pulse_text.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PulseAppBar(title: 'Scan QR'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 40,
          children: [
            GlassCard(
              child: Container(
                height: 250,
                width: 250,
                child: Center(
                  child: Text(
                    'Place QR code here.',
                    style: PulseText.bodyLight,
                  ),
                ),
              ),
            ),

            GlassCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.qrcode,
                      color: PulseColors.orange,
                      size: 16,
                    ),
                    Text('Click to Scan QR', style: PulseText.label),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
