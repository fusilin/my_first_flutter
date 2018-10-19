import 'package:flutter/material.dart';
import 'package:mfw/config.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'lofter',
        theme: new ThemeData(primaryColor: Colors.black),
        home: LofterApp());
  }
}
