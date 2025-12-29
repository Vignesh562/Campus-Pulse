import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 25,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/images/onboarding_2.svg",height: 100,color: PulseColors.primaryLight.withAlpha(25)),
          CircularProgressIndicator(color: Colors.white.withAlpha(10)),
          Text('Loading events...',style: PulseText.label.copyWith(color: Colors.white.withAlpha(10))),
        ],
      ),
    );
  }
}
