import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

// import 'theme.dart';
class DottedLine extends StatelessWidget {
  const DottedLine(
      {Key key, this.height, this.color, this.leftIndent, this.rightIndent})
      : super(key: key);
  final double height;
  final Color color;
  final double leftIndent;
  final double rightIndent;
  // color: color ?? new Color.fromARGB(255, 242, 242, 245),
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width.toDouble() - 32.0;
    List _buildItem(context) {
      List<Widget> _widget = [];
      for (int i = 0; i < _width; i = i + 2) {
        _widget.add(new Container(height: 1.0, width: 1.0, color: Colors.grey));
        _widget
            .add(new Container(height: 1.0, width: 1.0, color: Colors.white));
      }
      return _widget;
    }

    return new Container(
      height: height ?? 1.0,
      color: Colors.white,
      padding:
          EdgeInsets.only(left: leftIndent ?? 15.0, right: rightIndent ?? 15.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildItem(context)),
    );
  }
}
