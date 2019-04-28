import 'package:flutter/material.dart';
import 'package:mfw/components/text.dart';
import 'package:mfw/core/page_scaffold.dart';
import 'package:mfw/view/mine/message.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    void rightTap(){
//      Navigator.push(context, new MaterialPageRoute(builder: (c) {
//        return Message();
//      }));
//    }
    return new PageScaffold(
        barSettings: {
          'title': {'text': '我是标题hahahahahha哈哈哈哈哈哈哈'},
          'leftItems': {
            'leftItem0': {'type': 2}
          },
          'rightItems': {
            'rightItem0': {
              'type': 1,
              'text': '文字',
              'onTap': Message(),
            },
            'rightItem1': {
              'type': 2,
              'onTap': Setting(),
              'image': 'assets/images/icon_setup.png'
            },
          },
          'style': {'backgroundColor': new Color.fromARGB(255, 242, 242, 245)}
        },
        body: new Center(
          child: MText(title: '设置页enenen'),
        ));
  }
}
