import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/widgets/circular_container.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';

class AgendaCard extends StatelessWidget {
  final List<dynamic> agenda;

  const AgendaCard({
    super.key,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.screenPadding(vertical: 0),
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 15,
                child: Container(
                  width: 5,
                  height: 500,
                  color: PulseColors.primaryLight.withAlpha(25),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  for (int i = 0; i < agenda.length; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        CircularContainer(
                          color: i == 0 ? PulseColors.blue : PulseColors.primaryLight,
                          height: 12,
                          icon: FaIcon(FontAwesomeIcons.solidCircle),
                          padding: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5,
                            children: [
                              Text(
                                agenda[i]['time'],
                                style: PulseText.title.copyWith(
                                  color: PulseColors.blue,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                agenda[i]['title'],
                                style: PulseText.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                agenda[i]['description'],
                                style: PulseText.bodyLight,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
