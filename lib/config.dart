import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mfw/app.dart';
import 'dart:async';
import 'package:mfw/widget/route_animation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/model.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => new _ConfigState();
}

class _ConfigState extends State<Config> {
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  // 状态栏和header同色
  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }

  @override
  void initState() {
    super.initState();
    // 沉浸式
    appUIStyle();
    // double _w = MediaQuery.of(context).size.width;
    // Fluttertoast.showToast(msg: '$_w');
    // // ScopedModel.of<GlobalModel>(context)
    // //     .getDeviceWidth(_w);
    new Timer(new Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(context, AnimationPageRoute(builder: (c) {
        return MfwApp();
      }), (route) => route == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new Text('欢迎页, 等待完善'),
    ));
  }
}
