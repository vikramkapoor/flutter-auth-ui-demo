import 'package:flutter_web/material.dart';
import 'package:job_chat.ui/infrastructure/JcConfig.dart';
import 'package:job_chat.ui/infrastructure/JcRoute.dart';
import 'package:job_chat.ui/infrastructure/JcScreenBuilder.dart';
import 'package:job_chat.ui/screens/HomeScreen.dart';

void main() {
  JcConfig.FirebaseApiKey = 'AIzaSyBiUVZ3eIE-WRoB4OGDTTtzzaOd9qj5VCg';
  runApp(JobChat());
}

class JobChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: JcRoute.HomeLanding,
      debugShowCheckedModeBanner: false,
      routes: {
        JcRoute.HomeLanding: (context) => HomeScreen(),
        JcRoute.Coaches: (context) => CoachesScreen(),
      },
    );
  }
}

class CoachesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body = Center(
      child: RaisedButton(
        child: Text('Go back!'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    return JcPageBuilder.BuildScreen(
        context: context, title: "Coaches", body: body);
  }
}
