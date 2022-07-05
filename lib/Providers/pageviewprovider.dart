import 'dart:developer';

import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  PageController controller = PageController();
  String text = 'Next';
  int currentIndex = 0;


}
