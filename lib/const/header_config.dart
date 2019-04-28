import 'package:flutter/material.dart';

class HeaderConfig {
  static Map<String, List<Widget>> _LEFTITEM = {
    '1': <Widget>[],
    '2': <Widget>[
      new InkWell(
        onTap: () {
//          Navigator.pop(context);
        },
        child: new Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: new Image.asset('assets/images/icon_arrow_left.png',
                height: 22.0, width: 22.0)),
      ),
    ],
  };
}
