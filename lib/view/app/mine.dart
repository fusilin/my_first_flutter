import 'package:flutter/material.dart';
import 'package:mfw/widget/app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/model.dart';
import 'package:mfw/view/mine/find.dart';
import 'package:mfw/widget/dividing_line.dart';
import 'package:mfw/widget/divider_line.dart';
import 'package:mfw/widget/route_animation.dart';
import 'dart:ui';
import 'package:mfw/view/mine/history.dart';

class MineTab extends StatefulWidget {
  _MineTabState createState() => new _MineTabState();
}

class _MineTabState extends State<MineTab> {
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;
  final List<Map<String, Object>> _items = [
    {'name': '设置', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '交易记录', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '认证达人', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '我的应用', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '在线客户', 'icon': 'assets/images/ic_my_set.png'},
  ];

  void initState() {
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 80.0) {
        _isNeedSetAlpha = true;
        ScopedModel.of<CountModel>(context).changeTitleOpacity(
            ((_mScrollController.offset / 80) * 255).toInt());
      } else {
        if (_isNeedSetAlpha) {
          ScopedModel.of<CountModel>(context).changeTitleOpacity(255);
          _isNeedSetAlpha = false;
        }
      }
    });
    super.initState();
  }

  Padding buildPadding(
      String label, Color _color, double _fontSize, FontWeight _fontWeight) {
    return new Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: new Text(label,
            style: new TextStyle(
                color: _color, fontSize: _fontSize, fontWeight: _fontWeight)));
  }

  Widget buildColumn(onTap, Widget child, String label, double fontSize) {
    return new InkWell(
        onTap: onTap,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(0.0), child: child),
            new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child:
                    new Text(label, style: new TextStyle(fontSize: fontSize))),
          ],
        ));
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
            Navigator.of(context).push(new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return Find();
                },
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return new FadeTransition(
                    opacity: animation,
                    child: new SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0.0, 1.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child),
                  );
                }));
          },
          child: new Container(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
            color: new Color.fromARGB(255, 250, 220, 76),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      radius: 30.0,
                      backgroundImage: new NetworkImage(
                          "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildPadding(
                            "四阿哥", Colors.black, 22.0, FontWeight.w600),
                        buildPadding(
                            "Lv.2", Color(0xff666666), 12.0, FontWeight.w300)
                      ],
                    )
                  ],
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildPadding("个人主页", Colors.black, 13.0, FontWeight.w300),
                      new Icon(
                        Icons.chevron_right,
                        size: 22.0,
                        color: const Color(0xff000000),
                      )
                    ]),
              ],
            ),
          )),
    );
    _widget.add(new GestureDetector(
        onTap: () => Navigator.push(
            context,
            AnimationPageRoute(
                slideTween:
                    Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero),
                builder: (c) {
                  return Find();
                })),
        child: new Container(
            padding: const EdgeInsets.only(right: 15.0),
            color: new Color.fromARGB(255, 250, 220, 76),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                    flex: 2,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        buildColumn(
                            () => Navigator.push(
                                context,
                                AnimationPageRoute(
                                    slideTween: Tween<Offset>(
                                        begin: Offset(1.0, 0.0),
                                        end: Offset.zero),
                                    builder: (c) {
                                      return Find();
                                    })),
                            new Text('6', style: new TextStyle(fontSize: 14.0)),
                            '关注',
                            13.0),
                        buildColumn(
                            () => Navigator.push(
                                context,
                                AnimationPageRoute(
                                    slideTween: Tween<Offset>(
                                        begin: Offset(1.0, 0.0),
                                        end: Offset.zero),
                                    builder: (c) {
                                      return Find();
                                    })),
                            new Text('0', style: new TextStyle(fontSize: 14.0)),
                            '粉丝',
                            13.0),
                        buildColumn(
                            () => Navigator.push(
                                context,
                                AnimationPageRoute(
                                    slideTween: Tween<Offset>(
                                        begin: Offset(1.0, 0.0),
                                        end: Offset.zero),
                                    builder: (c) {
                                      return Find();
                                    })),
                            new Text('0', style: new TextStyle(fontSize: 14.0)),
                            '访客',
                            13.0)
                      ],
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            height: 32.0,
                            width: 84.0,
                            padding:
                                const EdgeInsets.only(top: 5.0, left: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(18.0)),
                            ),
                            child: buildPadding(
                                '打卡', Colors.black, 15.0, FontWeight.normal),
                          )
                        ]),
                  ),
                ]))));
    _widget.add(new Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            new Container(
              height: 25.0,
              color: new Color.fromARGB(255, 250, 220, 76),
            ),
            new Container(
              height: 65.0,
              color: new Color.fromARGB(255, 242, 242, 245),
            )
          ],
        ),
        new Positioned(
          top: 10.0,
          left: 15.0,
          right: 15.0,
          child: new Container(
            height: 80.0,
            width: window.physicalSize.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(7.0)),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildColumn(
                    () => Navigator.push(
                        context,
                        AnimationPageRoute(
                            slideTween: Tween<Offset>(
                                begin: Offset(1.0, 0.0), end: Offset.zero),
                            builder: (c) {
                              return Find();
                            })),
                    new Image.asset('assets/images/icon_hotel_collect.png',
                        height: 22.0, width: 22.0),
                    '我的收藏',
                    13.0),
                buildColumn(
                    () => Navigator.push(
                        context,
                        AnimationPageRoute(
                            slideTween: Tween<Offset>(
                                begin: Offset(1.0, 0.0), end: Offset.zero),
                            builder: (c) {
                              return Find();
                            })),
                    new Image.asset('assets/images/icon_hotel_order.png',
                        height: 22.0, width: 22.0),
                    '我的订单',
                    13.0),
                buildColumn(
                    () => Navigator.push(
                        context,
                        AnimationPageRoute(
                            slideTween: Tween<Offset>(
                                begin: Offset(1.0, 0.0), end: Offset.zero),
                            builder: (c) {
                              return History();
                            })),
                    new Image.asset('assets/images/icon_time_s.png',
                        height: 22.0, width: 22.0),
                    '我的历史',
                    13.0),
              ],
            ),
          ),
        )
      ],
    ));

    _widget.add(new GestureDetector(
      onTap: () => Navigator.push(
          context,
          AnimationPageRoute(
              slideTween:
                  Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero),
              builder: (c) {
                return Find();
              })),
      child: new Container(
        height: 180.0,
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
        width: window.physicalSize.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(7.0)),
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    ));
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(builder: (context, child, model) {
      return new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: MyAppBar(
          leading: <Widget>[
            new InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: 'left icon1');
              },
              child: new Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: new Image.asset('assets/images/icon_setup.png',
                      height: 22.0, width: 22.0)),
            ),
            new Padding(padding: EdgeInsets.only(right: 15.0)),
            new InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: 'left icon2');
              },
              child: new Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: new Image.asset('assets/images/icon_scavenging.png',
                    height: 22.0, width: 22.0),
              ),
            )
          ],
          isTitleGradient: true,
          title: '四阿哥',
          fontsize: 18.0,
          actions: <Widget>[
            new Padding(
                padding: EdgeInsets.all(0.0),
                child: new InkWell(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'right icon1');
                  },
                  child: new Padding(
                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: new Image.asset('assets/images/icon_message.png',
                        height: 22.0, width: 22.0),
                  ),
                ))
          ],
        ),
        body: new Listener(
            onPointerDown: (dd) {},
            onPointerMove: (sss) {},
            onPointerUp: (ss) {},
            onPointerCancel: (s) {},
            child: new SingleChildScrollView(
              controller: _mScrollController,
              child: new Column(children: buildItem(context)),
            )),
      );
    });
  }
}
