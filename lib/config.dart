import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:lofter/widget/icon_tab.dart';
import 'package:lofter/app/view/home.dart';
import 'package:lofter/app/view/find.dart';
import 'package:lofter/app/view/message.dart';
import 'package:lofter/app/view/mine.dart';
import 'package:flutter/services.dart';

const int HOME_INDEX = 0;
const int FIND_INDEX = 1;
const int MESSAGE_INDEX = 2;
const int MINE_INDEX = 3;
const double _TabTextSize = 11.0;
Color _lPrimaryColor = new Color.fromARGB(255, 0, 215, 198);

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

  var _bottomTitles = ["首页", "发现", "消息", "我的"];
  var _tabImages;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696), fontSize: _TabTextSize);

  final tabTextStyleSelected = new TextStyle(color: _lPrimaryColor, fontSize: _TabTextSize);
  int _currentIndex = 0;

  Image getTabImage(path) {
    return new Image.asset(path, width: 25.0, height: 25.0);
  }

  @override
  void initState() {
    appUIStyle();
    super.initState();
    if (_tabImages == null) {
      _tabImages = [
        [
          getTabImage('assets/images/ic_main_tab_company_nor.png'),
          getTabImage('assets/images/ic_main_tab_company_pre.png')
        ],
        [
          getTabImage('assets/images/ic_main_tab_find_nor.png'),
          getTabImage('assets/images/ic_main_tab_find_pre.png')
        ],
        [
          getTabImage('assets/images/ic_main_tab_contacts_nor.png'),
          getTabImage('assets/images/ic_main_tab_contacts_pre.png')
        ],
        [
          getTabImage('assets/images/ic_main_tab_my_nor.png'),
          getTabImage('assets/images/ic_main_tab_my_pre.png')
        ]
      ];
    }
  }

  // @override
  // void dispose() {}

  Image getTabIcon(int currentIndex) {
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
    // initData();
    return new Scaffold(
        body: new IndexedStack(
          children: <Widget>[
            new HomeTab(),
            new FindTab(),
            new MessageTab(),
            new MineTab()
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3))
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
