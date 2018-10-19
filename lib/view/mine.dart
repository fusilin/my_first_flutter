import 'package:flutter/material.dart';
import 'package:mfw/view/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:mfw/widget/dividing_line.dart';
import 'package:mfw/widget/divider_line.dart';
import 'package:mfw/widget/route_animation.dart';
import 'package:mfw/widget/fade_transition.dart';
// import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MineTab extends StatefulWidget {
  // const MineTab({Key key}) : super(key: key);
  @override
  _MineTabState createState() => new _MineTabState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _MineTabState extends State<MineTab> {
  final List<Map<String, Object>> _items = [
    {'name': '设置', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '交易记录', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '认证达人', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '我的应用', 'icon': 'assets/images/ic_my_set.png'},
    {'name': '在线客户', 'icon': 'assets/images/ic_my_set.png'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Padding buildPadding(String label, Color _color, double _fontSize) {
      return new Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: new Text(label,
              style: new TextStyle(color: _color, fontSize: _fontSize)));
    }

    Column buildColumn(String number, String label) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Text(number, style: new TextStyle(fontSize: 14.0))),
          new Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(label, style: new TextStyle(fontSize: 13.0))),
        ],
      );
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

    List buildTest() {
      List<Widget> _widget = [];
      for (int i = 0; i < _items.length; i++) {
        _widget.add(new GestureDetector(
            onTap: () => Navigator.push(
                context,
                AnimationPageRoute(
                    slideTween: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                    })),
            child: new Container(
                color: Colors.white,
                child: buildContainer(_items[i]['icon'], _items[i]['name']))));
        if (i < _items.length - 1) {
          _widget.add(DividerLine(1.0, null, null, null));
        }
      }
      return _widget;
    }

    List buildItem(context) {
      List<Widget> _widget = [];
      _widget.add(
        new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) {
                    return Search();
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
              // Navigator.of(context).push(new PageRouteBuilder(
              //     opaque: false,
              //     pageBuilder: (BuildContext context, _, __) {
              //       return Search();
              //     },
              //     transitionsBuilder:
              //         (_, Animation<double> animation, __, Widget child) {
              //       return new FadeTransition(
              //         opacity: animation,
              //         child: new RotationTransition(
              //           turns: new Tween<double>(begin: 0.5, end: 1.0)
              //               .animate(animation),
              //           child: child,
              //         ),
              //       );
              //     }));
              // Navigator.push(
              //   context,
              //   SlideRightRoute(widget: Search()),
              // );
              // Navigator.push(context, FadeTransiton(builder: (c) {
              //   return Search();
              // })
              // AnimationPageRoute(
              //     slideTween: Tween<Offset>(
              //         begin: Offset(1.0, 0.0), end: Offset.zero),
              //     builder: (c) {
              //       return Search();
              //     }),
              // );
            },
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/images/v.jpg"),
                    fit: BoxFit.fitWidth),
              ),
              child: new Container(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                color: const Color.fromARGB(200, 242, 242, 245),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          radius: 40.0,
                          backgroundImage: new NetworkImage(
                              "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            buildPadding("人生，没有如果", Colors.black, 16.0),
                            buildPadding(
                                "ID happay-520", Color(0xff666666), 12.0)
                          ],
                        )
                      ],
                    ),
                    new Icon(
                      Icons.chevron_right,
                      size: 22.0,
                      color: const Color(0xfff4f4f8),
                    )
                  ],
                ),
              ),
            )),
      );
      _widget.add(
        new GestureDetector(
            onTap: () => Navigator.push(
                context,
                AnimationPageRoute(
                    slideTween: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                    })),
            child: new Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                color: Colors.white,
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildColumn('66', '关注'),
                      buildColumn('1888', '粉丝'),
                      buildColumn('0', '喜欢')
                    ]))),
      );
      _widget.add(DividingLine(null, 10.0));
      for (int i = 0; i < _items.length; i++) {
        _widget.add(new GestureDetector(
            onTap: () => Navigator.push(
                context,
                AnimationPageRoute(
                    slideTween: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset.zero),
                    builder: (c) {
                      return Search();
                    })),
            child: new Container(
                color: Colors.white,
                child: buildContainer(_items[i]['icon'], _items[i]['name']))));
        if (i < _items.length - 1) {
          _widget.add(DividerLine(1.0, null, null, null));
        }
      }
      return _widget;
    }

    AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;
    final double _appBarHeight = 180.0;

    return Scaffold(
        // appBar: new AppBar(
        //   title: Text(
        //     '我的',
        //     style: TextStyle(
        //         fontSize: 14.0, color: new Color.fromARGB(255, 67, 67, 67)),
        //   ),
        //   elevation: 0.0,
        //   backgroundColor: new Color.fromARGB(255, 255, 230, 86),
        // ),
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        // body: new Container(
        //     child: new ListView(
        //   children: buildItem(context),
        // )),
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    Fluttertoast.showToast(msg: '测试');
                  },
                )
              ],
              flexibleSpace: new FlexibleSpaceBar(
                title: const Text('四阿哥哈哈哈'),
                background: new Stack(fit: StackFit.expand, children: <Widget>[
                  new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return Search();
                            },
                            transitionsBuilder: (_, Animation<double> animation,
                                __, Widget child) {
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
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage("assets/images/v.jpg"),
                              fit: BoxFit.fitWidth),
                        ),
                        child: new Container(
                          padding: const EdgeInsets.only(
                              top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                          color: const Color.fromARGB(200, 242, 242, 245),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: new NetworkImage(
                                        "http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg"),
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      buildPadding("四阿哥", Colors.black, 16.0),
                                      buildPadding(
                                          "Lv.2", Color(0xff666666), 12.0)
                                    ],
                                  )
                                ],
                              ),
                              new Icon(
                                Icons.chevron_right,
                                size: 22.0,
                                color: const Color(0xfff4f4f8),
                              )
                            ],
                          ),
                        ),
                      )),
                ]),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                // ,
              ]),
            ),
          ],
        ));
  }
}
