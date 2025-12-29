import 'package:campuspulse/screens/home/home_screen.dart';
import 'package:campuspulse/screens/onboarding/widgets/onboarding.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/login/login_screen.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      title: PulseText.onboarding3title,
      description: PulseText.onboarding3description,
      svgPath:"assets/images/onboarding_3.svg",
      buttonTxt: 'Get Started',
      buttonIcon: FaIcon(FontAwesomeIcons.forward),
      onNext: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      },
      onSkip: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
      },
    );
  }
}
