import 'package:flutter/material.dart';

class RouterClass {
  RouterClass._();

  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

  pushReplaceToSpecificScreenUsingWidget(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushToSpecificScreenUsingWidget(Widget widget) {
    BuildContext context = routerKey.currentState.context;
    routerKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  popwidget() {
    routerKey.currentState.pop();
  }
}
