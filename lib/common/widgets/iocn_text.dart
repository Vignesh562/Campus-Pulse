import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants/pulse_colors.dart';

class IconText extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String text;
  final double? iconSize;
  final TextStyle? txtStyle;

  const IconText({
    super.key, required this.icon, required this.iconColor, required this.text,  this.iconSize, this.txtStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        FaIcon(
          icon,
          size: iconSize ?? 15,
          color: iconColor,
        ),
        Text(text,style: txtStyle ?? PulseText.body, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
