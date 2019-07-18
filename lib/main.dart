import 'dart:html' as html;
import 'dart:html';

import 'package:flutter_auth_ui_demo/external/flutter-auth-ui/lib/faui.dart';
import 'package:flutter_web/material.dart';

void main() {
  runApp(FlutterAuthUiDemo());
}

class FlutterAuthUiDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool wantToSignIn = false;
  @override
  Widget build(BuildContext context) {
    Text("This is demo for ");

    if (faui.User == null && !this.wantToSignIn) {
      return Column(
        children: <Widget>[
          buildDescription(),
          RaisedButton(
            child: Text("Sign In"),
            onPressed: () {
              this.setState(() {
                this.wantToSignIn = true;
              });
            },
          )
        ],
      );
    }

    if (faui.User == null && this.wantToSignIn) {
      return faui.BuildAuthScreen(
        onSuccess: () {
          this.setState(() {
            this.wantToSignIn = false;
          });
        },
        onCancel: () {
          this.setState(() {
            this.wantToSignIn = false;
          });
        },
        firebaseApiKey: "AIzaSyA3hshWKqeogfYiklVCCtDaWJW8TfgWgB4",
      );
    }

    return Column(
      children: <Widget>[
        buildDescription(),
        Text("Hello, ${faui.User.email}"),
        RaisedButton(
          child: Text("Sign Out"),
          onPressed: () {
            faui.SignOut();
            this.setState(() {});
          },
        )
      ],
    );
  }

  static Widget buildDescription() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('This is demo for '),
        buildLink('flatter-auth-ui',
            'https://github.com/pcherkasova/flutter-auth-ui'),
        Text('. Find source code '),
        buildLink(
            'here', 'https://github.com/pcherkasova/flutter-auth-ui-demo'),
        Text('.'),
      ],
    );
  }

  static Widget buildLink(String text, String url) {
    return InkWell(
      child: Text(text, style: TextStyle(color: Colors.blue)),
      onTap: () {
        html.window.open(url, text);
      },
    );
  }
}
