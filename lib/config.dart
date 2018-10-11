import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lofter/app/view/home.dart';
import 'package:lofter/app/view/find.dart';
import 'package:lofter/app/view/add.dart';
import 'package:lofter/app/view/message.dart';
import 'package:lofter/app/view/mine.dart';
import 'package:flutter/services.dart';

const double _TabTextSize = 11.0;
Color _tabTextNormalColor = new Color(0xffDDDDDD);
Color _tabTextActiveColor = new Color(0xff666666);
Color _tabIconNormalColor = new Color(0xff999999);
Color _tabIconActiveColor = new Color(0xff444444);

class LofterApp extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<LofterApp> {
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  // 状态栏和header同色
  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }

  var _bottomTitles = ["首页", "发现", "添加", "消息", "我的"];
  var _tabImages;
  final tabTextStyleNormal =
      new TextStyle(color: _tabTextNormalColor, fontSize: _TabTextSize);

  final tabTextStyleSelected =
      new TextStyle(color: _tabTextActiveColor, fontSize: _TabTextSize);
  int _currentIndex = 0;

  Icon getTabImage(path, isActive, index) {
    print(path);
    return new Icon(path,
        color: isActive ?  _tabIconActiveColor: _tabIconNormalColor,
        size: index == 2 ? 30.0 : 26.0);
  }

  @override
  void initState() {
    // 沉浸式
    appUIStyle();
    super.initState();
    if (_tabImages == null) {
      _tabImages = [
        [getTabImage(Icons.home, true, 0), getTabImage(Icons.home, false, 0)],
        [
          getTabImage(Icons.supervisor_account, true, 1),
          getTabImage(Icons.supervisor_account, false, 1)
        ],
        [
          getTabImage(Icons.add_circle, true, 2),
          getTabImage(Icons.add_circle, false, 2)
        ],
        [
          getTabImage(Icons.notifications, true, 3),
          getTabImage(Icons.notifications, false, 3)
        ],
        [
          getTabImage(Icons.person, true, 4),
          getTabImage(Icons.person, false, 4)
        ]
      ];
    }
  }

  Icon getTabIcon(int currentIndex) {
    if (currentIndex == _currentIndex) {
      return _tabImages[currentIndex][0];
    }
    return _tabImages[currentIndex][1];
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
            new FindTab(),
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
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: new Text('')),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
            new BottomNavigationBarItem(
                icon: getTabIcon(4), title: getTabTitle(4)),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
