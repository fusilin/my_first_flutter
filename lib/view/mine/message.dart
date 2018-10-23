import 'package:flutter/material.dart';
import 'package:mfw/widget/app_bar.dart';
import 'package:mfw/widget/text.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        appBar: MyAppBar(
          leading: <Widget>[
            new InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: new Padding(
                  padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: new Image.asset('assets/images/icon_arrow_left.png',
                      height: 22.0, width: 22.0)),
            ),
          ],
          title: '消息中心',
          fontsize: 18.0,
          rBColor: 255,
          gBColor: 255,
          bBColor: 255,
        ),
        body: new Center(
          child: MText(title: '消息页'),
        ));
  }
}
