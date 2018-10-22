import 'package:flutter/material.dart';
import 'package:mfw/widget/route_animation.dart';
import 'package:mfw/widget/app_bar.dart';
import 'package:mfw/view/app/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/model.dart';

class Find extends StatefulWidget {
  _FindState createState() => new _FindState();
}

class _FindState extends State<Find> {
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;

  void initState() {
    _mScrollController.addListener(() {
      if (_mScrollController.offset < 250.0) {
        _isNeedSetAlpha = true;
        ScopedModel.of<CountModel>(context)
            .changeOpacity(((_mScrollController.offset / 250) * 255).toInt());
        ScopedModel.of<CountModel>(context).changeTitleOpacity(
            ((_mScrollController.offset / 250) * 255).toInt());
      } else {
        if (_isNeedSetAlpha) {
          ScopedModel.of<CountModel>(context).changeOpacity(255);
          ScopedModel.of<CountModel>(context).changeTitleOpacity(255);
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
            new Positioned(
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: MyAppBar(
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
                      child: new Image.asset(
                          'assets/images/icon_scavenging.png',
                          height: 22.0,
                          width: 22.0),
                    ),
                  )
                ],
                isHeaderGradient: true,
                isTitleGradient: true,
                // rBColor: 255,
                // gBColor: 230,
                // bBColor: 86,
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
                          child: new Image.asset(
                              'assets/images/icon_message.png',
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
            FloatingActionButton(
              onPressed: () {},
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
                            return Search();
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
