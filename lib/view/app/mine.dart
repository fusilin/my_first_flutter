import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:mfw/provide/provide.dart';
import 'package:mfw/core/page_scaffold.dart';
import 'package:mfw/view/app/mine/header.dart';

class MineTab extends StatefulWidget {
  _MineTabState createState() => new _MineTabState();
}

class _MineTabState extends State<MineTab> {
  ScrollController _mScrollController = new ScrollController();
  bool _isNeedSetAlpha = false;
  double _offset = 0.0;

  void initState() {
    Provide<ConfigProvide>(builder: (context, child, configProvide) {
      configProvide.changeTitleOpacity(0);
    });
    _mScrollController.addListener(() {
      _offset = _mScrollController.offset;
      if (_offset < 100.0) {
        if (_offset < 0.0) return;
        _isNeedSetAlpha = true;
        Provide<ConfigProvide>(builder: (context, child, configProvide) {
          configProvide.changeTitleOpacity(((_offset / 100) * 255).toInt());
        });
      } else {
        if (_isNeedSetAlpha) {
          Provide<ConfigProvide>(builder: (context, child, configProvide) {
            configProvide.changeTitleOpacity(255);
          });
          _isNeedSetAlpha = false;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ConfigProvide>(builder: (context, child, configProvide) {
      return PageScaffold(
          titleOpacity: 0,
//          backgroundColor: Color.fromARGB(255, 250, 220, 76),
          barSettings: {
            'title': {'text': 'Nothing'},
            'leftItems': {
              'leftItem0': {
                'type': 2,
                'image': 'assets/images/icon_setup.png',
                'onTap': '/setting'
              },
              'leftItem2': {
                'type': 2,
                'image': 'assets/images/icon_scavenging.png',
                'onTap': '/barcodeScan'
              }
            },
            'rightItems': {
              'rightItem': {
                'type': 2,
                'image': 'assets/images/icon_message.png',
                'onTap': '/message'
              }
            }
          },
          body: new Listener(
              onPointerDown: (dd) {},
              onPointerMove: (sss) {},
              onPointerUp: (ss) {},
              onPointerCancel: (s) {},
              child: new SingleChildScrollView(
                controller: _mScrollController,
                child: new Column(children: buildItem(context, configProvide)),
              )));
    });
  }
}
