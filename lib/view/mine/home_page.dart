import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:mfw/components/new_app_bar.dart';
import 'package:mfw/components/text.dart';
import 'package:mfw/style/size.dart';
import 'package:mfw/components/label.dart';
import 'package:provide/provide.dart';
import 'package:mfw/provide/provide.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mfw/view/mine/widget/home_page.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;
  RefreshController _refreshController;
  ValueNotifier<double> topOffsetLis = new ValueNotifier(0.0);
  ValueNotifier<double> bottomOffsetLis = new ValueNotifier(0.0);
  double _offset = 0.0;

  final List<Map<String, Object>> _items = [
    {'title': '今天访问', 'num': '0'},
    {'title': '累计访问', 'num': '0'}
  ];

  Widget _buildHeader(context, mode) {
    return new ClassicIndicator(
      mode: mode,
      idleText: '下拉刷新',
      releaseText: '释放刷新',
      refreshingText: '正在刷新',
      completeText: '刷新成功',
    );
  }

//  Widget _buildFooter(context, mode) {
//    return new ClassicIndicator(mode: mode);
//  }

  void _onOffsetCallback(bool isUp, double offset) {
    if (isUp) {
      topOffsetLis.value = offset;
    } else {
      bottomOffsetLis.value = offset;
    }

    if (offset < 250.0) {
      if (offset < 0.0) return;
      _isNeedSetAlpha = true;
      Provide<ConfigProvide>(builder: (context, child, configProvide){
        configProvide.changeTitleOpacity(((offset / 250) * 255).toInt());
      });
    } else {
      if (_isNeedSetAlpha) {
        Provide<ConfigProvide>(builder: (context, child, configProvide){
          configProvide.changeTitleOpacity(255);
        });
        _isNeedSetAlpha = false;
      }
    }
  }

  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    _refreshController = new RefreshController();
  }

  List buildItem() {
    List<Widget> _widget = [];
    for (int i = 0; i < _items.length; i++) {
      _widget.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MText(
            title: _items[i]['title'],
            color: Colors.white,
            fontSize: SizeConst.px12,
          ),
          MText(
            title: ' ' + _items[i]['num'],
            color: Color.fromARGB(255, 255, 230, 76),
            fontSize: SizeConst.px12,
          ),
        ],
      ));
    }
    return _widget;
  }

  Widget contentScrollView() {
    return new SmartRefresher(
      controller: _refreshController,
      headerBuilder: _buildHeader,
      headerConfig: new RefreshConfig(triggerDistance: 0.0),
      onRefresh: (up) {
        if (up) {
          new Future.delayed(const Duration(milliseconds: 1000)).then((val) {
            _refreshController.sendBack(true, RefreshStatus.completed);
          });
        }
      },
      onOffsetChange: _onOffsetCallback,
      child: ListView(
        children: <Widget>[],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ConfigProvide>(builder: (context, child, configProvide) {
      return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: new SliverToBoxAdapter(
                      child: MyAppBar(
                        barSettings: {
                          'leftItems': {
                            'leftItem': {'type': 2}
                          },
                        },
                      )),
                ),
              ];
            },
            body: new SmartRefresher(
                controller: _refreshController,
                headerBuilder: _buildHeader,
                headerConfig: new RefreshConfig(triggerDistance: 60.0),
                onRefresh: (up) {
                  if (up) {
                    new Future.delayed(const Duration(milliseconds: 2000))
                        .then((val) {
                      _refreshController.sendBack(true, RefreshStatus.completed);
                    });
                  }
                },
                onOffsetChange: _onOffsetCallback,
                child: ListView(children: <Widget>[
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
                                bottomRight:
                                Radius.elliptical(configProvide.deviceWidth / 2, 15.0),
                                bottomLeft:
                                Radius.elliptical(configProvide.deviceWidth / 2, 15.0)),
                          ),
                          child: new Padding(
                            padding: EdgeInsets.only(
                                top: configProvide.statusHeight + 48.0 + 8.0, left: 20.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        MText(
                                            title: 'Nothing',
                                            color: Colors.white,
                                            fontSize: SizeConst.px12,
                                            fontWeight: FontWeight.w600),
                                        new Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Label(
                                            height: 16.0,
                                            width: 26.0,
                                            color: const Color.fromARGB(
                                                255, 255, 220, 150),
                                            children: <Widget>[
                                              MText(
                                                title: 'LV.3',
                                                fontSize: SizeConst.px12,
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
                                      fontSize: SizeConst.px12,
                                    ),
                                    new Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: MText(
                                        title: '编辑个性签名，布置你的马蜂窝',
                                        color: Colors.white,
                                        fontSize: SizeConst.px12,
                                      ),
                                    )
                                  ],
                                ),
                                new Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: new Row(children: <Widget>[
                                      MText(
                                        title: '6关注',
                                        color: Colors.white,
                                        fontSize: SizeConst.px12,
                                      ),
                                      new Padding(
                                          padding:
                                          const EdgeInsets.only(left: 10.0),
                                          child: MText(
                                              title: '0粉丝',
                                              color: Colors.white,
                                              fontSize: SizeConst.px12))
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
                          child: MText(title: "dasdasdasdasd"),
                        ),
                      ),
                      new Container(
                        height: 250.0,
                        child: new Center(
                          child: MText(title: "dasdasdasdasd"),
                        ),
                      ),
                    ],
                  )
                ])),
          ));
    });
  }
}
