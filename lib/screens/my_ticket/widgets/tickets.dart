import 'package:campuspulse/common/widgets/iocn_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../common/widgets/pulse_tag.dart';
import '../../../common/widgets/shadow_container.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';

class Tickets extends StatefulWidget {

  final String eventName,date,time,location;
  bool confirm;



  Tickets({
    super.key, required this.eventName, required this.date, required this.time, required this.location,required this.confirm
  });

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.screenPadding(),
      child: GlassCard(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PulseTag(
                          color: widget.confirm ? PulseColors.green : PulseColors.red,
                          text: widget.confirm ?  'Confirmed' : 'Cancelled',
                        ),

                        Text(
                          widget.eventName,
                          style: PulseText.btnTxt,
                        ),

                        IconText(icon: FontAwesomeIcons.clock, iconColor: PulseColors.purple, text: widget.time,txtStyle: PulseText.title.copyWith(color: PulseColors.primaryLight)),

                        IconText(icon: FontAwesomeIcons.calendar, iconColor: PulseColors.blue, text: widget.date,txtStyle: PulseText.title.copyWith(color: PulseColors.primaryLight)),

                        IconText(icon: FontAwesomeIcons.locationPin, iconColor: PulseColors.green, text: widget.location,txtStyle: PulseText.title.copyWith(color: PulseColors.primaryLight)),

                      ],
                    ),
                  ),
                  ShadowContainer(
                    color: widget.confirm ? PulseColors.green :  PulseColors.red,
                    child: GlassCard(
                      child: Center(
                        child: QrImageView(
                          data: "https://github.com/pankajzx",
                          version: QrVersions.auto,
                          size: 100.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
