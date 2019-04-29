import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/model/model.dart';
import 'package:mfw/view/mine/barcode_scan.dart';
import 'package:mfw/view/mine/setting.dart';
import 'package:mfw/view/mine/message.dart';
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
    ScopedModel.of<GlobalModel>(context).changeTitleOpacity(0);
    _mScrollController.addListener(() {
      _offset = _mScrollController.offset;
      if (_offset < 100.0) {
        if (_offset < 0.0) return;
        _isNeedSetAlpha = true;
        ScopedModel.of<GlobalModel>(context)
            .changeTitleOpacity(((_offset / 100) * 255).toInt());
      } else {
        if (_isNeedSetAlpha) {
          ScopedModel.of<GlobalModel>(context).changeTitleOpacity(255);
          _isNeedSetAlpha = false;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return PageScaffold(
          titleOpacity: 0,
//          backgroundColor: Color.fromARGB(255, 250, 220, 76),
          barSettings: {
            'title': {'text': 'Nothing'},
            'leftItems': {
              'leftItem0': {
                'type': 2,
                'image': 'assets/images/icon_setup.png',
                'onTap': Setting()
              },
              'leftItem2': {
                'type': 2,
                'image': 'assets/images/icon_scavenging.png',
                'onTap': BarcodeScan()
              }
            },
            'rightItems': {
              'rightItem': {
                'type': 2,
                'image': 'assets/images/icon_message.png',
                'onTap': Message()
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
                child: new Column(
                    children: buildItem(context)
                ),
              )));
    });
  }
}
