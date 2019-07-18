import 'package:flutter_web/material.dart';
import 'package:job_chat.ui/external/flutter-auth-ui/lib/faui.dart';
import 'package:job_chat.ui/infrastructure/JcConfig.dart';
import 'package:job_chat.ui/infrastructure/JcScreenBuilder.dart';
import 'package:job_chat.ui/infrastructure/JcState.dart';
import 'package:job_chat.ui/utility/UiUtil.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback onCancel;

  DashboardScreen(VoidCallback this.onCancel) {}

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    if (faui.User == null) {
      return faui.BuildAuthScreen(
        onSuccess: UiUtil.Rebuild(this),
        onCancel: () {
          JcState.Intent = JcIntent.No;
          widget.onCancel();
        },
        firebaseApiKey: JcConfig.FirebaseApiKey,
      );
    }

    return JcPageBuilder.BuildScreen(
      context: context,
      title: "Home",
      body: Text("Dashboard for ${faui.User.email}"),
    );
  }
}
