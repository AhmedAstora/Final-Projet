import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:flutter/material.dart';

class RouterClass {
  RouterClass._();

  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> srouterKey = GlobalKey<NavigatorState>();

  pushReplaceToSpecificScreenUsingWidget(String widgetName) {
    srouterKey.currentState.pushReplacementNamed(widgetName);
  }

  pushToSpecificScreenUsingWidget(String widgetName) {
    srouterKey.currentState.pushNamed(widgetName);
  }


  pushToSpecificScreen(Widget widget) {
    srouterKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  popwidget() {
    srouterKey.currentState.pop();
  }
}
