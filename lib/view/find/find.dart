import 'package:flutter/material.dart';
import 'package:mfw/view/tab_bar_view.dart';
import 'package:mfw/widget/route_animation.dart';
import 'package:fluro/fluro.dart';
import 'package:mfw/widget/app_bar.dart';
// import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/find/model.dart';

class FindTab extends StatefulWidget {
  FindTabState createState() => new FindTabState();
}

class FindTabState extends State<FindTab> {
  //创建顶层状态
  CountModel countModel = CountModel();

  ScrollController _mScrollController = new ScrollController();
  // GlobalKey<CustomTitleBarState>_mTitleKey = new GlobalKey();
  CustomTitleBarController _mCustomTitleBarController =
      new CustomTitleBarController();
  bool _isNeedSetAlpha = false;

  void initState() {
    CountModel countModel = CountModel();
    _mCustomTitleBarController.value.alpha = 0;
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 80.0) {
        _isNeedSetAlpha = true;
        countModel.change(((_mScrollController.offset / 80) * 255).toInt());
        _mCustomTitleBarController.value.alpha =
            ((_mScrollController.offset / 80) * 255).toInt();
        // _mTitleKey.currentState.setState(() {});
      } else {
        if (_isNeedSetAlpha) {
          _mCustomTitleBarController.value.alpha = 255;
          countModel.change(255);
          // _mTitleKey.currentState.setState(() {});
          _isNeedSetAlpha = false;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(builder: (context, child, model) {
      return new Scaffold(
        appBar: MyAppBar(
          // controller: _mCustomTitleBarController,
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
          backgroundColor: new Color.fromARGB(255, 255, 230, 86),
          title: '四阿哥',
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
              child: new Column(children: <Widget>[
                new Container(
                  color: Colors.grey,
                  height: 200.0,
                  child: new Center(
                    child: new Text("dasdasdasdasd"),
                  ),
                ),
                new Container(
                  height: 200.0,
                  child: new Center(
                    child: new Text("dasdasdasdasd"),
                  ),
                ),
                new Container(
                  height: 200.0,
                  color: Colors.grey,
                  child: new Center(
                    child: new Text("dasdasdasdasd"),
                  ),
                ),
                new Container(
                  height: 200.0,
                  child: new Center(
                    child: new Text("dasdasdasdasd"),
                  ),
                ),
              ]),
            )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                final router = Router();
              },
              child: new Text(
                '地图',
                style: TextStyle(color: Colors.green, fontSize: 14.0),
              ),
              heroTag: 'test1',
              tooltip: 'test1',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      AnimationPageRoute(
                          slideTween: Tween<Offset>(
                              begin: Offset(1.0, 0.0), end: Offset.zero),
                          builder: (c) {
                            return TabBarViewSample();
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
