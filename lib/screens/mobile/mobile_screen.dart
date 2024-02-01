import 'package:diplomversec/screens/mobile/courier_mobile_page.dart';
import 'package:flutter/widgets.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return CourierMobilePage();
  }
}
