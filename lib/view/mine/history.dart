import 'package:flutter/material.dart';
import 'package:mfw/core/page_scaffold.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        barSettings: {
          'title': {'text': '历史'},
          'leftItems': {
            'leftItem0': {'type': 2}
          },
        },
        body: new Center(
          child: new Text('历史页', style: TextStyle(fontSize: 18.0)),
        ));
  }
}
