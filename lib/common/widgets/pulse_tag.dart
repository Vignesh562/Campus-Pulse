import 'package:flutter/material.dart';

import '../../utils/constants/pulse_text.dart';

class PulseTag extends StatelessWidget {


  final Color color;
  final String text;

  const PulseTag({
    super.key,
    required this.color,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(10),
          border: BoxBorder.all(color: color.withAlpha(50))
      ),
      child: Text(text,style: PulseText.body.copyWith(color: color),),
    );
  }
}
