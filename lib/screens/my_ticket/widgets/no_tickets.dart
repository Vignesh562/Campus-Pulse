import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';

class NoTickets extends StatelessWidget {
  const NoTickets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 25,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/images/no_tickets.svg",height: 100,color: PulseColors.primaryLight.withAlpha(25)),
          Text('You have not joined any event.',style: PulseText.label.copyWith(color: PulseColors.primaryLight.withAlpha(50))),
        ],
      ),
    );
  }
}
