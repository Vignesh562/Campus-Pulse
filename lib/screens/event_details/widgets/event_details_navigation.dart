import 'package:campuspulse/common/widgets/shadow_container.dart';
import 'package:campuspulse/screens/event_details/widgets/qr_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/circular_container.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/utils.dart';

class EventDetailsNavigation extends StatefulWidget {
  const EventDetailsNavigation({super.key});

  @override
  State<EventDetailsNavigation> createState() => _EventDetailsNavigationState();
}

class _EventDetailsNavigationState extends State<EventDetailsNavigation> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Utils.screenPadding(vertical: 14),
        child: Row(
          spacing: 15,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircularContainer(
                color: PulseColors.primary,
                icon: FaIcon(FontAwesomeIcons.arrowLeft),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                  print(isFavorite);
                });
              },
              child: CircularContainer(
                color: isFavorite ? PulseColors.red : PulseColors.primary,
                icon: isFavorite
                    ? FaIcon(FontAwesomeIcons.solidHeart)
                    : FaIcon(FontAwesomeIcons.heart),
              ),
            ),
            GestureDetector(
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (_)=>QrCodeScreen()));
              // },
              child: CircularContainer(
                color: PulseColors.primary,
                icon: FaIcon(FontAwesomeIcons.arrowUpFromBracket),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
