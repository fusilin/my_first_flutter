import 'package:flutter/material.dart';
import 'package:mfw/config.dart';
import 'package:mfw/routes/route.dart';
import 'package:provide/provide.dart';
import 'package:mfw/provide/provide.dart';

void main() {
  // 全屏
  // SystemChrome.setEnabledSystemUIOverlays([]);
  var configProvide = ConfigProvide();
  var providers = Providers();
  providers.provide(Provider<ConfigProvide>.value(configProvide));
  runApp(ProviderNode(
    child: new MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
//  GlobalModel countModel = GlobalModel();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '马蜂窝旅游',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.black),
      home: Config(),
      routes: routes,
    );
  }
}
