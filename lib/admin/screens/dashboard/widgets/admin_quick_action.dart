import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/widgets/glass_card.dart';
import '../../../../utils/constants/pulse_colors.dart';
import '../../../../utils/constants/pulse_text.dart';

class AdminQuickAction extends StatelessWidget {
  final int eventCount;

  const AdminQuickAction({super.key, required this.eventCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GlassCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                FaIcon(
                  FontAwesomeIcons.calendarWeek,
                  color: PulseColors.blue,
                  size: 15,
                ),
                Text(
                  'TOTAL EVENTS',
                  style: PulseText.label.copyWith(
                    color: PulseColors.primaryLight,
                  ),
                ),

                FaIcon(
                  FontAwesomeIcons.arrowTrendUp,
                  color: PulseColors.green,
                  size: 12,
                ),
                Text(
                  eventCount.toString(),
                  style: PulseText.btnTxt.copyWith(color: PulseColors.green),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GlassCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circlePlus,
                        size: 15,
                        color: PulseColors.green,
                      ),
                      Text('New Event', style: PulseText.body),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 10),

              GlassCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.qrcode,
                        size: 15,
                        color: PulseColors.orange,
                      ),
                      Text('Verify QR', style: PulseText.body),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 10),
              GlassCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.userGroup,
                        size: 15,
                        color: PulseColors.purple,
                      ),
                      Text('All users', style: PulseText.body),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Current Events', style: PulseText.label)],
        ),
        
      ],
    );
  }
}
