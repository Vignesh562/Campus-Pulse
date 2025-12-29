import 'package:campuspulse/screens/onboarding/onboarding2screen.dart';
import 'package:campuspulse/screens/onboarding/widgets/onboarding.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/login/login_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      title: PulseText.onboarding1title,
      description: PulseText.onboarding1description,
      svgPath:"assets/images/onboarding_1.svg",
      buttonTxt: 'Next',
      buttonIcon: FaIcon(FontAwesomeIcons.forward),
      onNext: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Onboarding2Screen()));
      },
      onSkip: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      },
    );
  }
}

