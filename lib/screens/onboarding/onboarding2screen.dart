import 'package:campuspulse/screens/onboarding/widgets/onboarding.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../auth/login/login_screen.dart';
import 'onboarding3screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      title: PulseText.onboarding2title,
      description: PulseText.onboarding2description,
      svgPath:"assets/images/onboarding_2.svg",
      buttonTxt: 'Next',
      buttonIcon: FaIcon(FontAwesomeIcons.forward),
      onNext: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Onboarding3Screen()));
      },
      onSkip: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      },
    );
  }
}
