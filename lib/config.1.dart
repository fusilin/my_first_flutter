import 'package:flutter/material.dart';
import 'package:lofter/widget/icon_tab.dart';
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

class HomeState extends State<LofterApp> with SingleTickerProviderStateMixin {
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }

  var _bottomTitles = ["首页", "发现", "消息", "我的"];
  // 底部导航栏未选中时的图片
  var _bottomIconNotChecked = [
    "assets/images/ic_main_tab_company_nor.png",
    "assets/images/ic_main_tab_find_nor.png",
    "assets/images/ic_main_tab_contacts_nor.png",
    "assets/images/ic_main_tab_my_nor.png"
  ];
  // 底部导航栏选中时的图片
  var _bottomIconChecked = [
    "assets/images/ic_main_tab_company_pre.png",
    "assets/images/ic_main_tab_find_pre.png",
    "assets/images/ic_main_tab_contacts_pre.png",
    "assets/images/ic_main_tab_my_pre.png"
  ];
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState() {
    appUIStyle();
    super.initState();
    _controller =
        new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new HomeTab(),
          new FindTab(),
          new MessageTab(),
          new MineTab()
        ],
        controller: _controller,
      ),
      bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
              controller: _controller,
              labelStyle: new TextStyle(fontSize: _TabTextSize),
              indicatorColor: Colors.white,
              tabs: <IconTab>[
                new IconTab(
                    icon: _currentIndex == HOME_INDEX
                        ? "assets/images/ic_main_tab_company_pre.png"
                        : "assets/images/ic_main_tab_company_nor.png",
                    text: "首页",
                    color: _currentIndex == HOME_INDEX
                        ? _lPrimaryColor
                        : Colors.grey[900]),
                new IconTab(
                    icon: _currentIndex == FIND_INDEX
                        ? "assets/images/ic_main_tab_contacts_pre.png"
                        : "assets/images/ic_main_tab_contacts_nor.png",
                    text: "发现",
                    color: _currentIndex == FIND_INDEX
                        ? _lPrimaryColor
                        : Colors.grey[900]),
                new IconTab(
                    icon: _currentIndex == MESSAGE_INDEX
                        ? "assets/images/ic_main_tab_find_pre.png"
                        : "assets/images/ic_main_tab_find_nor.png",
                    text: "消息",
                    color: _currentIndex == MESSAGE_INDEX
                        ? _lPrimaryColor
                        : Colors.grey[900]),
                new IconTab(
                    icon: _currentIndex == MINE_INDEX
                        ? "assets/images/ic_main_tab_my_pre.png"
                        : "assets/images/ic_main_tab_my_nor.png",
                    text: "我的",
                    color: _currentIndex == MINE_INDEX
                        ? _lPrimaryColor
                        : Colors.grey[900])
              ])),
    );
  }
}
