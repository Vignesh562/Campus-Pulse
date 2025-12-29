import 'package:campuspulse/common/widgets/pulse_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';

class EventDetailsCard extends StatelessWidget {
  final String category, eventName, tagline, location, fullLocation, date, time;

  const EventDetailsCard({
    super.key,
    required this.category,
    required this.eventName,
    required this.tagline,
    required this.location,
    required this.fullLocation,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.screenPadding(vertical: 0),
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PulseTag(color: PulseColors.blue, text: 'Category'),
                  PulseTag(color: PulseColors.blue, text: category),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  eventName,
                  style: PulseText.heading,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Text(tagline, style: PulseText.bodyLight),

              Divider(
                color: PulseColors.primaryLight.withAlpha(50),
                thickness: 0.5,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              color: PulseColors.blue,
                              size: 15,
                            ),
                            Text(
                              'DATE',
                              style: PulseText.title.copyWith(
                                color: PulseColors.primaryLight,
                              ),
                            ),
                          ],
                        ),

                        Text(date, style: PulseText.title),
                      ],
                    ),

                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidClock,
                              color: PulseColors.purple,
                              size: 15,
                            ),
                            Text(
                              'TIME',
                              style: PulseText.title.copyWith(
                                color: PulseColors.primaryLight,
                              ),
                            ),
                          ],
                        ),

                        Text(time, style: PulseText.title),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(
                color: PulseColors.primaryLight.withAlpha(50),
                thickness: 0.5,
              ),

              Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationPin,
                        color: PulseColors.green,
                        size: 15,
                      ),
                      Text(
                        'LOCATION',
                        style: PulseText.title.copyWith(
                          color: PulseColors.primaryLight,
                        ),
                      ),
                    ],
                  ),

                  Text(location, style: PulseText.title),
                  Text(fullLocation, style: PulseText.bodyLight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
