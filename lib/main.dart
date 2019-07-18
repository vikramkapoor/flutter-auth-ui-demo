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
    if (faui.User == null && !this.wantToSignIn) {
      return Column(
        children: <Widget>[
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
}
