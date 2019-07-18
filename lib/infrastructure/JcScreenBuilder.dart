import 'package:flutter_web/foundation.dart';
import 'package:flutter_web/material.dart';
import 'package:job_chat.ui/infrastructure/JcRoute.dart';
import 'package:job_chat.ui/utility/UiUtil.dart';

class JcPageBuilder {
  static Scaffold BuildScreen({
    @required BuildContext context,
    @required String title,
    @required Widget body,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: _GetMenuActions(context: context),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _GetDrawerItems(context: context),
        ),
      ),
    );
  }

  static List<Widget> _GetDrawerItems({
    @required BuildContext context,
  }) {
    var result = <Widget>[];

    if (faui.User != null) {
      result.add(DrawerHeader(
        child: Text(faui.User.email),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ));
    }

    result.addAll([
      ListTile(
        title: Text('Home'),
        onTap: () {
          UiUtil.PopAndPushIfNotCurrent(
              context: context, route: JcRoute.HomeLanding);
        },
      ),
      ListTile(
        title: Text('Coaches'),
        onTap: () {
          UiUtil.PopAndPushIfNotCurrent(
              context: context, route: JcRoute.Coaches);
        },
      ),
    ]);

    if (faui.User != null) {
      result.add(ListTile(
        title: Text('Sign Out'),
        onTap: () {
          faui.SignOut();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
        },
      ));
    }

    return result;
  }

  static List<Widget> _GetMenuActions({
    @required BuildContext context,
  }) {
    return Navigator.of(context).canPop()
        ? <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            )
          ]
        : null;
  }
}
