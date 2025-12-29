import 'package:campuspulse/common/widgets/glass_card.dart';
import 'package:campuspulse/utils/constants/pulse_colors.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/widgets/pulse_appbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PulseAppBar(title: "Favourite Events"),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/images/no_fav.svg",height: 100,color: PulseColors.primaryLight.withAlpha(25)),
            Text('Your favourite event list is empty.',style: PulseText.label.copyWith(color: PulseColors.primaryLight.withAlpha(50)))
          ],
        ),
      ) ,
    );
  }
}
