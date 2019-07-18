import 'package:flutter_web/material.dart';
import 'package:job_chat.ui/infrastructure/JcRoute.dart';
import 'package:job_chat.ui/infrastructure/JcScreenBuilder.dart';
import 'package:job_chat.ui/infrastructure/JcState.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback cancel;

  LandingScreen(VoidCallback this.cancel) {}

  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Search coaches'),
          onPressed: () {
            Navigator.pushNamed(context, JcRoute.Coaches);
          },
        ),
        RaisedButton(
          child: Text('Publish student profile'),
          onPressed: () async {
            JcState.Intent = JcIntent.BecomeStudent;
            this.cancel();
          },
        ),
      ],
    );

    return JcPageBuilder.BuildScreen(
        context: context, title: "Home", body: body);
  }
}
