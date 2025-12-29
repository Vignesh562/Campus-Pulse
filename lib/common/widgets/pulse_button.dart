import 'package:campuspulse/common/widgets/shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants/pulse_colors.dart';
import '../../utils/constants/pulse_text.dart';
import 'glass_card.dart';

class PulseButton extends StatelessWidget {
  final Color color;
  final String btnName;
  final IconData? icon;
  VoidCallback onTap;
  bool? isSmall;

  PulseButton({
    super.key,
    required this.btnName,
    this.icon,
    required this.onTap,
    required this.color,
    this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              btnName,
              style: (isSmall == true)
                  ? PulseText.label.copyWith(color: color)
                  : PulseText.btnTxt.copyWith(color: color),
            ),
            icon != null ? FaIcon(icon, color: color, size: 15) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
