import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/glass_card.dart';
import '../../../common/widgets/shadow_container.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';

class EventButton extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color txtColor,iconColor;


  const EventButton({
    super.key, required this.text, required this.icon, required this.txtColor, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ShadowContainer(
        child: GlassCard(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: PulseText.label.copyWith(color: txtColor),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 25,
                width: 1,
                color: PulseColors.primaryLight,
              ),
              FaIcon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
