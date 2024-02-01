import 'package:diplomversec/screens/desktop/desktop_screen.dart';
import 'package:diplomversec/screens/mobile/mobile_screen.dart';
import 'package:flutter/material.dart';

class ScreenChoice extends StatefulWidget {
  const ScreenChoice({super.key});

  @override
  State<ScreenChoice> createState() => _ScreenChoiceState();
}

class _ScreenChoiceState extends State<ScreenChoice> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return MobileScreen();
      } else {
        return DesktopScreen();
      }
    });
  }
}
