import 'package:campuspulse/common/widgets/shadow_container.dart';
import 'package:campuspulse/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/glass_card.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';

class ProfileCard extends StatefulWidget {

  final String name,imagePath,universityName;

  const ProfileCard({
    super.key, required this.name, required this.imagePath, required this.universityName,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:

            ShadowContainer(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Text(widget.name, style: PulseText.txt,textAlign: TextAlign.center),

          Text(widget.universityName, style: PulseText.bodyLight,textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
