import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: Text('搜索', style: TextStyle(fontSize: 20.0)),
        ),
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        body: new Center(
          child: new Text('我是搜索页', style: TextStyle(fontSize: 18.0)),
        ));
  }
}
