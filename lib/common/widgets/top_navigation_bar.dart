import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants/pulse_colors.dart';
import '../../utils/constants/pulse_text.dart';
import '../../utils/utils.dart';
import 'circular_container.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopNavigationBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Utils.screenPadding(vertical: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircularContainer(
                color: PulseColors.primary,
                icon: const FaIcon(FontAwesomeIcons.arrowLeft),
              ),
            ),

            const SizedBox(width: 15),


            Expanded(
              child: Text(
                title,
                style: PulseText.btnTxt,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
