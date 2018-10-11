import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: Icon(Icons.clear),
              iconSize: 24.0,
              onPressed: () {
                Fluttertoast.showToast(msg: '请点击物理返回键退出');
              }),
          elevation: 0.0,
          title: Text('搜索', style: TextStyle(fontSize: 20.0)),
        ),
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        body: new Center(
          child: new Text('I am nothing', style: TextStyle(fontSize: 18.0)),
        ));
  }
}
