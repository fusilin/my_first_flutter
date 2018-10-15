import 'package:flutter/material.dart';
import 'package:lofter/config.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

void main() {
  fluwx.register(appId: "wx75566e779930ff64");
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'lofter',
        theme: new ThemeData(primaryColor: Colors.white),
        home: LofterApp());
  }
}
