import 'package:flutter/material.dart';
import 'package:mfw/widget/route_animation.dart';
import 'package:mfw/widget/app_bar.dart';
import 'package:mfw/view/app/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mfw/widget/text.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/model.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.white;
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;

  void initState() {
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
                  child: new Column(children: <Widget>[
                    new Container(
                      height: 250.0,
                      width: window.physicalSize.width,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: const AssetImage(
                            'assets/images/mine_home_page.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.yellow,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.elliptical(300.0, 30.0),
                            bottomLeft: Radius.elliptical(300.0, 30.0)),
                      ),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[new Row(children: <Widget>[])],
                      ),
                    ),
                    new Container(
                      height: 250.0,
                      child: new Center(
                        child: new Text("dasdasdasdasd"),
                      ),
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
                  ]),
                )),
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
                          height: 22.0,
                          width: 22.0),
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
