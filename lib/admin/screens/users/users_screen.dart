import 'package:campuspulse/common/widgets/pulse_appbar.dart';
import 'package:campuspulse/utils/constants/pulse_text.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PulseAppBar(title: 'All users'),
      body: Center(child: Text('All Users ',style: PulseText.btnTxt),),
    );
  }
}
