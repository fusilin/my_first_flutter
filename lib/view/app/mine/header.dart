import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:mfw/view/mine/home_page.dart';
import 'package:mfw/components/text.dart';

final List<Map<String, Object>> _card = [
  {
    'title': '我的收藏',
    'image': 'assets/images/mine_icon_collection.png',
    'route': HomePage()
  },
  {
    'title': '我的订单',
    'image': 'assets/images/mine_icon_order.png',
    'route': HomePage()
  },
  {
    'title': '我的历史',
    'image': 'assets/images/mine_icon_history.png',
    'route': HomePage()
  }
];

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
              child: new Text(label, style: new TextStyle(fontSize: fontSize))),
        ],
      ));
}

List<Widget> buildCard(context) {
  List<Widget> _widget = <Widget>[];
  for (int i = 0; i < _card.length; i++) {
    _widget.add(buildColumn(
        () => Navigator.push(context, MaterialPageRoute(builder: (c) {
              return _card[i]['route'];
            })),
        new Image.asset(_card[i]['image'], height: 22.0, width: 22.0),
        _card[i]['title'],
        13.0));
  }
  return _widget;
}

List buildItem(context) {
  List<Widget> _widget = [];
  _widget.add(
    new GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
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
                          "Nothing", Colors.black, 22.0, FontWeight.w600),
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
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) {
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
                                  MaterialPageRoute(builder: (c) {
                                return HomePage();
                              })),
                          new Text('6', style: new TextStyle(fontSize: 14.0)),
                          '关注',
                          13.0),
                      buildColumn(
                          () => Navigator.push(context,
                                  MaterialPageRoute(builder: (c) {
                                return HomePage();
                              })),
                          new Text('0', style: new TextStyle(fontSize: 14.0)),
                          '粉丝',
                          13.0),
                      buildColumn(
                          () => Navigator.push(context,
                                  MaterialPageRoute(builder: (c) {
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
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0),
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
            children: buildCard(context),
          ),
        ),
      )
    ],
  ));

  _widget.add(new GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) {
          return HomePage();
        })),
    child: new Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
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
                    title: '我的旅行', fontWeight: FontWeight.w500, fontSize: 16.0),
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
                    borderRadius: BorderRadius.all(const Radius.circular(25.0)),
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
              new Expanded(flex: 1, child: new Text(''))
            ],
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MText(title: '去看看有趣的世界吧', fontSize: 14.0, color: Colors.blue),
                ]),
          )
        ],
      ),
    ),
  ));
  _widget.add(new Container(
    margin:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(const Radius.circular(7.0)),
    ),
    width: window.physicalSize.width,
    height: 500.0,
    child: MText(),
  ));
  return _widget;
}
