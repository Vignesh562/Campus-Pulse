import 'package:campuspulse/common/widgets/pulse_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../common/widgets/gradient_background.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';

class Onboarding extends StatelessWidget {
  String svgPath, title, description, buttonTxt;
  final Icon buttonIcon;
  VoidCallback onNext, onSkip;

  Onboarding({
    super.key,
    required this.svgPath,
    required this.title,
    required this.description,
    required this.buttonTxt,
    required this.buttonIcon,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Utils.screenPadding(vertical: 20),
              child: Column(
                spacing: 5,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onSkip,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 12,
                              color: PulseColors.primaryLight,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(width: 10),
                        FaIcon(
                          FontAwesomeIcons.forward,
                          size: 10,
                          color: PulseColors.primaryLight,
                        ),
                      ],
                    ),
                  ),
        
                  SizedBox(height: 10),
        
                  GlassCard(
                    child: SvgPicture.asset(svgPath, height: 350),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: PulseText.heading,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: PulseText.bodyLight,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 20),

                  PulseButton(btnName: buttonTxt, onTap: onNext, color: PulseColors.primary)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
