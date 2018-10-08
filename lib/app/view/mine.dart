import 'package:flutter/material.dart';
import 'package:lofter/app/view/search.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

class MineTab extends StatelessWidget {
  final double _appBarHeight = 75.0;

  var _items = ["设置", "交易记录", "认证达人", "我的应用", "在线客户"];
  var _imagePaths = [
    "assets/images/ic_my_set.png",
    "assets/images/ic_my_set.png",
    "assets/images/ic_my_set.png",
    "assets/images/ic_my_set.png",
    "assets/images/ic_my_set.png"
  ];
  @override
  Widget build(BuildContext context) {
    Padding buildPadding(String label) {
      return new Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: new Text(label,
              style: new TextStyle(color: Colors.white, fontSize: 16.0)));
    }

    Column buildColumn(String number, String label) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Text(number, style: new TextStyle(fontSize: 14.0))),
          new Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(label, style: new TextStyle(fontSize: 13.0))),
        ],
      );
    }

    Row buildListColumn(String url, String label) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset(url, width: 20.0, height: 20.0),
              new Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new Text(label, style: new TextStyle(fontSize: 13.0))),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset("assets/images/ic_arrow_right.png",
                  width: 14.0, height: 14.0),
            ],
          )
        ],
      );
    }

    Container buildContainer(String url, String label) {
      return new Container(
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 12.0, left: 15.0, right: 15.0),
          color: Colors.white,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[buildListColumn(url, label)],
          ));
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            // 顶部标题
            title: Text(
              '我的',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // 打开搜索页面
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search()));
                  })
            ],
            // icon的主题设置
            iconTheme: IconThemeData(color: Colors.white)),
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        body: new ListView(
          children: [
            new GestureDetector(
                onTap: () {
                  // // Fluttertoast.showToast(
                  // //   msg: MediaQueryData.fromWindow(window)
                  // //       .padding
                  // //       .top
                  // //       .toString(),
                  //   toastLength: Toast.LENGTH_LONG,
                  // );
                  Navigator.of(context).push(
                    new CupertinoPageRoute<void>(
                        builder: (BuildContext context) => new Search()),
                  );
                },
                child: new Container(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
                  color: Colors.blue,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        radius: 35.0,
                        backgroundImage: new NetworkImage(
                            "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildPadding("人生，没有如果"),
                          buildPadding("ID happay-520")
                        ],
                      )
                    ],
                  ),
                )),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    color: Colors.white,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          buildColumn('65', '关注'),
                          buildColumn('1888', '粉丝'),
                          buildColumn('0', '喜欢')
                        ]))),
            new Container(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    color: Colors.white,
                    child: buildContainer(_imagePaths[0], _items[0]))),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    color: Colors.white,
                    child: buildContainer(_imagePaths[1], _items[1]))),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    color: Colors.white,
                    child: buildContainer(_imagePaths[2], _items[2]))),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    color: Colors.white,
                    child: buildContainer(_imagePaths[3], _items[3]))),
            new GestureDetector(
                onTap: () => Navigator.of(context).push(
                      new CupertinoPageRoute<void>(
                          builder: (BuildContext context) => new Search()),
                    ),
                child: new Container(
                    color: Colors.white,
                    child: buildContainer(_imagePaths[4], _items[4])))
          ],
        ));
  }
}
