import 'package:flutter/material.dart';
import 'package:mfw/components/route_animation.dart';
import 'package:mfw/components/app_bar.dart';
import 'package:mfw/view/app/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mfw/components/text.dart';
import 'package:mfw/components/label.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/model/model.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

import 'package:mfw/view/mine/widget/home_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.white;
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;

  final List<Map<String, Object>> _items = [
    {'title': '今天访问', 'num': '0'},
    {'title': '累计访问', 'num': '0'}
  ];

  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 250.0) {
        _isNeedSetAlpha = true;
        ScopedModel.of<GlobalModel>(context)
            .changeOpacity(((_mScrollController.offset / 250) * 255).toInt());
        ScopedModel.of<GlobalModel>(context).changeTitleOpacity(
            ((_mScrollController.offset / 250) * 255).toInt());
        if (_mScrollController.offset < 100.0) {
          setState(() {
            _color = Colors.white;
          });
        } else {
          setState(() {
            _color = Colors.black;
          });
        }
      } else {
        if (_isNeedSetAlpha) {
          ScopedModel.of<GlobalModel>(context).changeOpacity(255);
          ScopedModel.of<GlobalModel>(context).changeTitleOpacity(255);
          setState(() {
            _color = Colors.black;
          });
          _isNeedSetAlpha = false;
        }
      }
    });
    super.initState();
  }

  List buildItem() {
    List<Widget> _widget = [];
    for (int i = 0; i < _items.length; i++) {
      _widget.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MText(
            title: _items[i]['title'],
            color: Colors.white,
            fontSize: 12.0,
          ),
          MText(
            title: ' ' + _items[i]['num'],
            color: Color.fromARGB(255, 255, 230, 76),
            fontSize: 12.0,
          ),
        ],
      ));
    }
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Listener(
                onPointerDown: (dd) {},
                onPointerMove: (sss) {},
                onPointerUp: (ss) {},
                onPointerCancel: (s) {},
                child: new SingleChildScrollView(
                    controller: _mScrollController,
                    child: new Stack(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                                height: 280.0,
                                width: window.physicalSize.width,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: const AssetImage(
                                      'assets/images/mine_home_page.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.elliptical(
                                          model.deviceWidth / 2, 15.0),
                                      bottomLeft: Radius.elliptical(
                                          model.deviceWidth / 2, 15.0)),
                                ),
                                child: new Padding(
                                  padding: EdgeInsets.only(
                                      top: model.statusHeight + 48.0 + 8.0,
                                      left: 20.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: new NetworkImage(
                                            "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                                      ),
                                      new Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              MText(
                                                  title: '四阿哥',
                                                  color: Colors.white,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w600),
                                              new Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Label(
                                                  height: 16.0,
                                                  width: 26.0,
                                                  color: const Color.fromARGB(
                                                      255, 255, 220, 150),
                                                  children: <Widget>[
                                                    MText(
                                                      title: 'LV.3',
                                                      fontSize: 11.0,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                      new Row(
                                        children: <Widget>[
                                          MText(
                                            title: '上海',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: MText(
                                              title: '编辑个性签名，布置你的马蜂窝',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      new Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: new Row(children: <Widget>[
                                            MText(
                                              title: '6关注',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                            new Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: MText(
                                                    title: '0粉丝',
                                                    color: Colors.white,
                                                    fontSize: 12.0))
                                          ]))
                                    ],
                                  ),
                                )),
                            new Container(
                              height: 60.0,
                              color: Colors.white,
                              child: buildRowTab(),
                            ),
                            new Container(
                              height: 250.0,
                              color: Colors.grey,
                              child: new Center(
                                child: new Text("dasdasdasdasd"),
                              ),
                            ),
                            new Container(
                              height: 250.0,
                              child: new Center(
                                child: new Text("dasdasdasdasd"),
                              ),
                            ),
                          ],
                        ),
                        new Positioned(
                          top: 48.0 + model.statusHeight,
                          right: 0.0,
                          child: Label(
                            height: 46.0,
                            width: 90.0,
                            color: Color.fromARGB(40, 0, 0, 0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(23.0),
                              bottomLeft: Radius.circular(20.0),
                            ),
                            children: <Widget>[
                              new Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: buildItem(),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ))),
            new Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: MyAppBar(
                leading: <Widget>[
                  new InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: new Image.asset(
                          'assets/images/icon_arrow_left.png',
                          color: _color,
                          height: 24.0,
                          width: 24.0),
                    ),
                  )
                ],
                isHeaderGradient: true,
                isTitleGradient: true,
                rBColor: 255,
                gBColor: 255,
                bBColor: 255,
                title: '四阿哥',
                actions: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(0.0),
                      child: new InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: new Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: new Image.asset(
                              'assets/images/mine_icon_menu.png',
                              color: _color,
                              height: 22.0,
                              width: 22.0),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
                      (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                    return new Search();
                  }, transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) {
                    return SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(0.0, 0.0),
                          end: const Offset(-1.0, 0.0),
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    );
                  }));
                },
                child: const Icon(Icons.touch_app),
                heroTag: 'test2',
                tooltip: 'test2',
              ),
            )
          ],
        ),
      );
    });
  }
}
