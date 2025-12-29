import 'package:flutter/material.dart';

import '../../../common/widgets/glass_card.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';

class AboutEventCard extends StatelessWidget {

  final String about;

  const AboutEventCard({
    super.key, required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.screenPadding(vertical: 0),
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                about,
                // 'Neon Night Music Fest is where music, lights, and energy come together for an unforgettable experience. Step into a vibrant world glowing with neon colors, pulsing beats, and electrifying performances from top DJs and live artists. Dance under the open sky, vibe with your friends, and lose yourself in the rhythm as the night lights up with laser shows, UV décor, and immersive visuals. Whether you’re here for the music, the atmosphere, or the memories — Neon Night Music Fest promises non-stop fun, good vibes, and moments you’ll talk about long after the lights fade. Get ready to glow!',
                style: PulseText.bodyLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

