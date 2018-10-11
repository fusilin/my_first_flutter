import 'package:flutter/material.dart';
import 'package:lofter/app/view/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lofter/widget/dividing_line.dart';
import 'package:lofter/widget/divider_line.dart';
import 'package:lofter/widget/route_animation.dart';
import 'dart:async';
import 'package:flutter_refresh/flutter_refresh.dart';

class MineTab extends StatelessWidget {
  final List<Map<String, Object>> _items = [
    {'name': '设置', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '交易记录', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '认证达人', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '我的应用', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '在线客户', 'icon': 'assets/images/ic_my_set.png'},
  ];

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {});
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    Padding buildPadding(String label, Color _color, double _fontSize) {
      return new Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: new Text(label,
              style: new TextStyle(color: _color, fontSize: _fontSize)));
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
              new Icon(Icons.chevron_right,
                  size: 22.0, color: const Color(0xff999999))
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

    List buildItem(context) {
      List<Widget> _widget = [];
      _widget.add(
        new GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  AnimationPageRoute(
                      slideTween: Tween<Offset>(
                          begin: Offset(1.0, 0.0), end: Offset.zero),
                      builder: (c) {
                        return Search();
                      }));
            },
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/v.jpg"),
                    fit: BoxFit.fitWidth),
              ),
              child: new Container(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                color: const Color.fromARGB(200, 242, 242, 245),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          radius: 40.0,
                          backgroundImage: new NetworkImage(
                              "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildPadding("人生，没有如果", Colors.black, 16.0),
                            buildPadding(
                                "ID happay-520", Color(0xff666666), 12.0)
                          ],
                        )
                      ],
                    ),
                    new Icon(
                      Icons.chevron_right,
                      size: 22.0,
                      color: const Color(0xfff4f4f8),
                    )
                  ],
                ),
              ),
            )),
      );
      _widget.add(
        new GestureDetector(
            onTap: () => Navigator.push(
                context,
                AnimationPageRoute(
                    slideTween: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                    })),
            child: new Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                color: Colors.white,
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildColumn('66', '关注'),
                      buildColumn('1888', '粉丝'),
                      buildColumn('0', '喜欢')
                    ]))),
      );
      _widget.add(DividingLine(null, 10.0));
      for (int i = 0; i < _items.length; i++) {
        _widget.add(new GestureDetector(
            onTap: () => Navigator.push(
                context,
                AnimationPageRoute(
                    slideTween: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                    })),
            child: new Container(
                color: Colors.white,
                child: buildContainer(_items[i]['icon'], _items[i]['name']))));
        if (i < _items.length - 1) {
          _widget.add(DividerLine(1.0, null, null, null));
        }
      }
      return _widget;
    }

    return new SafeArea(
      child: Scaffold(
          backgroundColor: new Color.fromARGB(255, 242, 242, 245),
          body: new Refresh(
            onHeaderRefresh: onHeaderRefresh,
            childBuilder: (BuildContext context,
                {ScrollController controller, ScrollPhysics physics}) {
              return new Container(
                  child: new ListView(
                physics: physics,
                controller: controller,
                children: buildItem(context),
              ));
            },
          )),
    );
  }
}
