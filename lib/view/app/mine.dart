import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/model/model.dart';
import 'package:mfw/components/app_bar.dart';
import 'package:mfw/view/mine/home_page.dart';
import 'package:mfw/components/route_animation.dart';
import 'package:mfw/components/text.dart';
import 'package:mfw/view/mine/barcode_scan.dart';
import 'package:mfw/view/mine/setting.dart';
import 'package:mfw/view/mine/message.dart';
//import 'package:mfw/core/ch_page.dart';

class MineTab extends StatefulWidget {
  _MineTabState createState() => new _MineTabState();
}

class _MineTabState extends State<MineTab> {
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;

//  @ChPage('test')
  void initState() {
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 80.0) {
        _isNeedSetAlpha = true;
        ScopedModel.of<GlobalModel>(context).changeTitleOpacity(
            ((_mScrollController.offset / 80) * 255).toInt());
      } else {
        if (_isNeedSetAlpha) {
          ScopedModel.of<GlobalModel>(context).changeTitleOpacity(255);
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

  List buildItem(context) {
    List<Widget> _widget = [];
    _widget.add(
      new GestureDetector(
          onTap: () {
            Navigator.push(context, AnimationPageRoute(builder: (c) {
              return HomePage();
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
        onTap: () => Navigator.push(context, AnimationPageRoute(builder: (c) {
              return HomePage();
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
                            () => Navigator.push(context,
                                    AnimationPageRoute(builder: (c) {
                                  return HomePage();
                                })),
                            new Text('6', style: new TextStyle(fontSize: 14.0)),
                            '关注',
                            13.0),
                        buildColumn(
                            () => Navigator.push(context,
                                    AnimationPageRoute(builder: (c) {
                                  return HomePage();
                                })),
                            new Text('0', style: new TextStyle(fontSize: 14.0)),
                            '粉丝',
                            13.0),
                        buildColumn(
                            () => Navigator.push(context,
                                    AnimationPageRoute(builder: (c) {
                                  return HomePage();
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
                    () => Navigator.push(context,
                            AnimationPageRoute(builder: (c) {
                          return HomePage();
                        })),
                    new Image.asset('assets/images/mine_icon_collection.png',
                        height: 22.0, width: 22.0),
                    '我的收藏',
                    13.0),
                buildColumn(
                    () => Navigator.push(context,
                            AnimationPageRoute(builder: (c) {
                          return HomePage();
                        })),
                    new Image.asset('assets/images/mine_icon_order.png',
                        height: 22.0, width: 22.0),
                    '我的订单',
                    13.0),
                buildColumn(
                    () => Navigator.push(context,
                            AnimationPageRoute(builder: (c) {
                          return HomePage();
                        })),
                    new Image.asset('assets/images/mine_icon_history.png',
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
      onTap: () => Navigator.push(context, AnimationPageRoute(builder: (c) {
            return HomePage();
          })),
      child: new Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
        width: window.physicalSize.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(7.0)),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MText(
                      title: '我的旅行',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                  new Icon(
                    Icons.chevron_right,
                    size: 18.0,
                    color: const Color(0xff000000),
                  )
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(flex: 1, child: new Text('')),
                new Expanded(
                  flex: 3,
                  child: new Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 230, 86),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(25.0)),
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset('assets/images/mine_icon_camera.png',
                            width: 20.0, height: 20.0),
                        MText(
                            title: '记录你的旅行',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ],
                    ),
                  ),
                ),
                new Expanded(flex: 1, child: new Text('')),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MText(
                        title: '去看看有趣的世界吧', fontSize: 14.0, color: Colors.blue),
                  ]),
            ),
          ],
        ),
      ),
    ));
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: MyAppBar(
          leading: <Widget>[
            new InkWell(
              onTap: () {
                Navigator.push(context, AnimationPageRoute(builder: (c) {
                  return Setting();
                }));
              },
              child: new Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: new Image.asset('assets/images/icon_setup.png',
                      height: 24.0, width: 24.0)),
            ),
            new Padding(padding: EdgeInsets.only(right: 15.0)),
            new InkWell(
              onTap: () {
                Navigator.push(context, AnimationPageRoute(builder: (c) {
                  return BarcodeScan();
                }));
              },
              child: new Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: new Image.asset('assets/images/icon_scavenging.png',
                    height: 24.0, width: 24.0),
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
                    Navigator.push(context, new MaterialPageRoute(builder: (c) {
                      return Message();
                    }));
//                    Navigator.push(context, AnimationPageRoute(builder: (c) {
//                      return Message();
//                    }));
                  },
                  child: new Padding(
                    padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: new Image.asset('assets/images/icon_message.png',
                        height: 24.0, width: 24.0),
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
