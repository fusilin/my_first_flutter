import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ConfigProvide with ChangeNotifier {
  double statusHeight = 0.0;
  double deviceWidth = 0.0;
  int opacity = 0;
  String title = '';
  int titleOpacity = 255;

  getStatusHeight(value) {
    statusHeight = value;
    print('statusHeight: ${statusHeight}');
    notifyListeners();
  }

  getDeviceWidth(value) {
    deviceWidth = value;
    notifyListeners();
  }

  changeOpacity(value) {
    opacity = value;
    notifyListeners();
  }

  changeTitle(value) {
    title = value;
    notifyListeners();
  }

  changeTitleOpacity(value) {
    titleOpacity = value;
    notifyListeners();
  }
}
