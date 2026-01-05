import 'package:campuspulse/common/widgets/glass_card.dart';
import 'package:campuspulse/common/widgets/pulse_appbar.dart';
import 'package:campuspulse/common/widgets/shadow_container.dart';
import 'package:campuspulse/screens/home/widgets/upcoming_event_card.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:campuspulse/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GlassCard(
        child: ShadowContainer(
          color: PulseColors.green,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: PulseColors.green.withAlpha(25),
            child: FaIcon(FontAwesomeIcons.plus, color: PulseColors.green),
          ),
        ),
      ),
      appBar: PulseAppBar(title: 'Dashboard'),
      body: Padding(
        padding: Utils.screenPadding(),
        child: Column(
          children: [
            Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GlassCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.userGroup,
                          color: PulseColors.blue,
                          size: 15,
                        ),
                        Text(
                          'TOTAL USERS',
                          style: PulseText.label.copyWith(
                            color: PulseColors.primaryLight,
                          ),
                        ),
                        Spacer(),
                        FaIcon(
                          FontAwesomeIcons.arrowTrendUp,
                          color: PulseColors.green,
                          size: 12,
                        ),
                        Text(
                          '25',
                          style: PulseText.btnTxt.copyWith(
                            color: PulseColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GlassCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.circlePlus,
                                size: 15,
                                color: PulseColors.green,
                              ),
                              Text('New Event', style: PulseText.body),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      GlassCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.qrcode,
                                size: 15,
                                color: PulseColors.orange,
                              ),
                              Text('Verify QR', style: PulseText.body),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      GlassCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 15,
                                color: PulseColors.purple,
                              ),
                              Text('All users', style: PulseText.body),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Current Events', style: PulseText.label)],
                ),

                SizedBox(height: 1)
              ],
            ),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => UpcomingEventCard(
                  title: 'Event Title',
                  location: 'location of event',
                  color: PulseColors.blue,
                  category: 'category',
                  date: DateTime.now(),
                ),
                separatorBuilder: (context, index) => Utils.spacePulse(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
