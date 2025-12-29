import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../common/widgets/iocn_text.dart';
import '../../../common/widgets/pulse_button.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';
import '../../event_details/event_details_screen.dart';

class FeaturedCard extends StatelessWidget {

  final String eventName;
  final String imgUrl;
  final String date;
  final String location;
  final eventId;

  const FeaturedCard({
    super.key, required this.imgUrl, required this.date, required this.location, required this.eventName, this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        spacing: 20,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              imgUrl,
              // "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          Text(eventName, style: PulseText.txt),

          SizedBox(
            height: 20,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                IconText(
                  icon: FontAwesomeIcons.calendar,
                  iconColor: PulseColors.blue,
                  text: date,
                ),

                Utils.spacePulse(height: 0, width: 20),

                IconText(
                  icon: FontAwesomeIcons.locationPin,
                  iconColor: PulseColors.green,
                  text:location,
                ),
              ],
            ),
          ),

          PulseButton(
            btnName: 'Join Event',
            isSmall: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EventDetailsScreen(eventId: eventId)),
              );
            },
            color: PulseColors.blue,
          ),
        ],
      ),
    );
  }
}
