import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/circular_container.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';


class PerformersCard extends StatelessWidget {

  final String name,role ;

  const PerformersCard({
    super.key, required this.name, required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: GlassCard(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularContainer(
              icon: FaIcon(FontAwesomeIcons.drum),
              height: 25,
              color: PulseColors.purple,
            ),
            Utils.spacePulse(height: 5),
            Text(name, style: PulseText.title),
            Text(role, style: PulseText.bodyLight),
          ],
        ),
      ),
    );
  }
}


