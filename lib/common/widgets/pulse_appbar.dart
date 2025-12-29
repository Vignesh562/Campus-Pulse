import 'package:flutter/material.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:campuspulse/screens/profile/profile_screen.dart';

import '../../utils/utils.dart';

class PulseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PulseAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 250,

      leading: Padding(
        padding: Utils.screenPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.formatDate(DateTime.now()).toUpperCase(),
              style: PulseText.body.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
            Text(
              title,
              style: PulseText.heading.copyWith(fontSize: 26),
            ),
          ],
        ),
      ),

      actions: [
        Padding(
          padding: Utils.screenPadding(),
          // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2020/01/07/23/01/sketch-4748895_1280.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
