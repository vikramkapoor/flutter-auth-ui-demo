import 'package:flutter_web/material.dart';

class UiUtil {
  static VoidCallback Rebuild(State<StatefulWidget> state) {
    return () {
      state.setState(() {});
    };
  }

  static void PopAndPushIfNotCurrent({
    @required BuildContext context,
    @required String route,
  }) {
    String curent = ModalRoute.of(context).settings.name;
    Navigator.pop(context);
    if (curent != route) Navigator.pushNamed(context, route);
  }
}
