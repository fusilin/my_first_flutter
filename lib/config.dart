import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:provide/provide.dart';
import 'package:mfw/provide/provide.dart';
import 'dart:ui';
// import 'package:splashscreen/splashscreen.dart';

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

  final configProvide = ConfigProvide();

  @override
  void initState() {
    super.initState();
    // 沉浸式
    appUIStyle();
    new Timer(new Duration(milliseconds: 1500), () {
      Navigator.pushReplacementNamed(context, '/mfwApp');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    configProvide.getStatusHeight(MediaQuery.of(context).padding.top);
    configProvide.getDeviceWidth(MediaQuery.of(context).size.width);
  }

  @override
  Widget build(BuildContext context) {
    // return new SplashScreen(
    //   seconds: 3,
    //   navigateAfterSeconds: new MfwApp(),
    //   // title: new Text('Welcome In SplashScreen'),
    //   image: new Image.asset('assets/images/screen.png'),
    //   backgroundColor: Colors.blue,
    // );
    return new Scaffold(
        body: new Center(
      child: new Text('欢迎页, 待完善'),
    ));
  }
}
