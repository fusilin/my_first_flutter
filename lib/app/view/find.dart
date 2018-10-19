import 'package:flutter/material.dart';
import 'package:mfw/app/view/tab_bar_view.dart';
import 'package:mfw/widget/route_animation.dart';
import 'package:fluro/fluro.dart';
import 'package:mfw/widget/app_bar.dart';
// import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

class FindTab extends StatefulWidget {
  FindTabState createState() => new FindTabState();
}

class FindTabState extends State<FindTab> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar(
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
      // body: new Center(child: new InkWell()),
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
  }
}
