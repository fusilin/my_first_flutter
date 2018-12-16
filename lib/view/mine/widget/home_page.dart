import 'package:flutter/material.dart';
import 'package:mfw/components/text.dart';

final List<Map<String, Object>> _rowItems = [
  {'title': '游记', 'num': '0'},
  {'title': '问答', 'num': '0'},
  {'title': '视频', 'num': '0'},
  {'title': '点评', 'num': '0'},
];

List buildRowItem() {
  List<Widget> _widget = [];
  for (int i = 0; i < _rowItems.length; i++) {
    _widget.add(MText(title: _rowItems[i]['title']));
    _widget.add(MText(title: _rowItems[i]['num']));
  }
  return _widget;
}

Container buildRowTab() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: buildRowItem(),
    ),
  );
}
