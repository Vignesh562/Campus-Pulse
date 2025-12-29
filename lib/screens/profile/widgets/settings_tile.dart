import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/circular_container.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';

class SettingsTile extends StatelessWidget {

  final Icon icon;
  final Color color;
  final String name;
  VoidCallback? onTap;

  SettingsTile({
    super.key, required this.icon, required this.color, required this.name,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 10,
        children: [
          CircularContainer(
            color: color,
            icon: icon,
          ),
          Text(name, style: PulseText.body),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FaIcon(FontAwesomeIcons.angleRight, size: 15),
          ),
        ],
      ),
    );
  }
}
