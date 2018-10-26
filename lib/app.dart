import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mfw/view/app/home.dart';
import 'package:mfw/view/app/search.dart';
import 'package:mfw/view/app/add.dart';
import 'package:mfw/view/app/message.dart';
import 'package:mfw/view/app/mine.dart';
import 'package:flutter/services.dart';

const double _TabTextSize = 11.0;
Color _tabTextNormalColor = new Color(0xff666666);
Color _tabTextActiveColor = new Color(0xff404346);

class MfwApp extends StatefulWidget {
  @override
  _MfwAppState createState() => new _MfwAppState();
}

class _MfwAppState extends State<MfwApp> {
  var _bottomTitles = ["首页", "上海", "", "酒店", "我的"];
  var _tabImages;
  final tabTextStyleNormal =
      new TextStyle(color: _tabTextNormalColor, fontSize: _TabTextSize);

  final tabTextStyleSelected = new TextStyle(
      color: _tabTextActiveColor,
      fontSize: _TabTextSize,
      fontWeight: FontWeight.w600);
  int _currentIndex = 0;

  Widget getTabImage(path, index) {
    if (index == 2) {
      return new Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: new Image.asset(
            path,
            width: 30.0,
            height: 30.0,
          ));
    }
    return new Image.asset(
      path,
      width: 24.0,
      height: 24.0,
    );
  }

  @override
  void initState() {
    // 非全屏
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
    if (_tabImages == null) {
      _tabImages = [
        [
          getTabImage('assets/images/ic_tab_homepage_normal.png', 0),
          getTabImage('assets/images/ic_tab_homepage_selected.png', 0),
        ],
        [
          getTabImage('assets/images/ic_tab_destination_normal.png', 1),
          getTabImage('assets/images/ic_tab_destination_selected.png', 1)
        ],
        [
          getTabImage('assets/images/ic_tab_expand_normal.png', 2),
          getTabImage('assets/images/ic_tab_expand_selected.png', 2)
        ],
        [
          getTabImage('assets/images/ic_tab_hotel_normal.png', 3),
          getTabImage('assets/images/ic_tab_hotel_selected.png', 3)
        ],
        [
          getTabImage('assets/images/ic_tab_mine_normal.png', 4),
          getTabImage('assets/images/ic_tab_mine_selected.png', 4)
        ]
      ];
    }
  }

  Widget getTabIcon(int currentIndex) {
    if (currentIndex == _currentIndex) {
      return _tabImages[currentIndex][1];
    }
    return _tabImages[currentIndex][0];
  }

  Text getTabTitle(int currentIndex) {
    return new Text(_bottomTitles[currentIndex],
        style: getTabTextStyle(currentIndex));
  }

  TextStyle getTabTextStyle(int currentIndex) {
    if (currentIndex == _currentIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new IndexedStack(
          children: <Widget>[
            new HomeTab(),
            new Search(),
            new AddTab(),
            new MessageTab(),
            new MineTab()
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: new CupertinoTabBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                activeIcon: getTabIcon(0),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1),
                activeIcon: getTabIcon(1),
                title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2),
                activeIcon: getTabIcon(2),
                title: new Text('')),
            new BottomNavigationBarItem(
                icon: getTabIcon(3),
                activeIcon: getTabIcon(3),
                title: getTabTitle(3)),
            new BottomNavigationBarItem(
                icon: getTabIcon(4),
                activeIcon: getTabIcon(4),
                title: getTabTitle(4)),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              if (index == 0 || index == 2 || index == 4) {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
                    .copyWith(statusBarIconBrightness: Brightness.dark));
              } else {
                SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
                    .copyWith(statusBarIconBrightness: Brightness.light));
              }
              _currentIndex = index;
            });
          },
        ));
  }
}
