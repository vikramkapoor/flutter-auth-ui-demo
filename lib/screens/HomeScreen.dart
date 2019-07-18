import 'package:flutter_web/material.dart';
import 'package:job_chat.ui/external/flutter-auth-ui/lib/faui.dart';
import 'package:job_chat.ui/infrastructure/JcState.dart';
import 'package:job_chat.ui/screens/DashboardScreen.dart';
import 'package:job_chat.ui/screens/LandingScreen.dart';
import 'package:job_chat.ui/utility/UiUtil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (JcState.Intent == JcIntent.No && faui.User == null) {
      return LandingScreen(UiUtil.Rebuild(this));
    }

    return DashboardScreen(UiUtil.Rebuild(this));
  }
}
