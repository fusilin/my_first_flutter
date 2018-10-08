import 'package:flutter/material.dart';
import 'package:lofter/config.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'lofter',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: LofterApp(),
    );
  }
}
