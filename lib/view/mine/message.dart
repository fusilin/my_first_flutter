import 'package:flutter/material.dart';
import 'package:mfw/core/page_scaffold.dart';
import 'package:mfw/view/mine/setting.dart';

class Message extends StatefulWidget {
  _MessageState createState() => new _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        barSettings: {
          'title': {'text': '消息中心'},
          'leftItems': {
            'leftItem0': {'type': 2}
          },
          'rightItems': {
            'rightItem0': {
              'type': 2,
              'onTap': Setting(),
              'image': 'assets/images/icon_setup.png'
            }
          }
        },
        body: new Center(
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (e) {
                return Setting();
              }));
            },
            child: new Padding(
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: new Image.asset('assets/images/icon_setup.png',
                    height: 24.0, width: 24.0)),
          ),
        ));
  }
}
