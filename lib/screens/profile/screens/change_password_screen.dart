import 'package:flutter/material.dart';

import 'package:campuspulse/common/widgets/circular_container.dart';
import 'package:campuspulse/common/widgets/top_navigation_bar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/glass_card.dart';
import '../../../common/widgets/pulse_button.dart';
import '../../../utils/constants/pulse_colors.dart';
import '../../../utils/constants/pulse_text.dart';
import '../../../utils/utils.dart';
import '../../auth/widget/textfield_pulse.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String btnText = "Change Password";
  Color btnColor = PulseColors.primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavigationBar(title: 'Change Password'),

      body: Padding(
        padding: Utils.screenPadding(),
        child: ListView(
          children: [
            GlassCard(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 15,
                  children: [

                    TextFieldPulse(
                      // controller: passwordController,
                      label: 'Old password',
                      hint: 'Enter old password',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required.';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),

                    TextFieldPulse(
                      // controller: passwordController,
                      label: 'New password',
                      hint: 'Enter new password',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required.';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),

                    TextFieldPulse(
                      // controller: passwordController,
                      label: 'Confirm password',
                      hint: 'Confirm new password',
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required.';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),

            Utils.spacePulse(),
            Utils.spacePulse(),

            PulseButton(
              icon: FontAwesomeIcons.circleCheck,
              onTap: () async {
                setState(() {
                  btnText = 'Change Password';
                  btnColor = PulseColors.green;
                });
                await Future.delayed(Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              },
              color: btnColor,
              btnName: btnText,
            ),
            Utils.spacePulse(),
          ],
        ),
      ),
    );
  }
}
