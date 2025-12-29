import 'package:flutter/material.dart';
import '../../utils/constants/pulse_colors.dart';


class CircularContainer extends StatelessWidget {

  final Color color;
  final double height;
  final Widget? child;
  final Icon? icon;
  final double padding;

  const CircularContainer({
    super.key, this.height=15,required this.color,this.child,this.icon,this.padding=10
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        shape: BoxShape.circle,
        border: BoxBorder.all(color: color.withAlpha(50)),
      ),
      child: icon != null
          ? Icon(
        icon!.icon,
        size: height,
        color: color,
      )
          : Center(child: child),
    );
  }
}