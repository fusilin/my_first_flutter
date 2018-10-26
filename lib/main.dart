import 'package:flutter/material.dart';
import 'package:mfw/config.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/model/model.dart';
import 'package:flutter/services.dart';

void main() {
  // 全屏
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  GlobalModel countModel = GlobalModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<GlobalModel>(
        model: countModel,
        child: new MaterialApp(
            title: '马蜂窝旅游',
            theme: new ThemeData(primaryColor: Colors.black),
            home: Config()));
  }
}
