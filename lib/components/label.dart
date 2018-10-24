import 'package:flutter/material.dart';
import 'dart:ui';

// 用于有带有背景色圆角的label,可加点击事件
class Label extends StatelessWidget {
  const Label({
    Key key,
    this.onTap,
    @required this.height,
    @required this.width,
    @required this.color,
    this.borderRadius,
    this.children,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final double height;
  final double width;
  final Color color;
  final BorderRadius borderRadius;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () => onTap ?? {},
        child: new Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius:
                  borderRadius ?? BorderRadius.all(const Radius.circular(3.0)),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )));
  }
}
