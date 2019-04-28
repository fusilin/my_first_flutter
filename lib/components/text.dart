import 'package:flutter/material.dart';
import 'package:mfw/style/size.dart';
import 'package:mfw/style/color.dart';
import 'dart:ui';

class MText extends StatelessWidget {
  const MText(
      {Key key,
      this.title='',
      this.textAlign,
      this.maxLines,
      this.fontSize,
      this.color,
      this.fontWeight})
      : super(key: key);
  final String title;
  final TextAlign textAlign;
  final int maxLines;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return maxLines != null
        ? new Text(
            title ?? '',
            textAlign: textAlign ?? TextAlign.center,
            maxLines: maxLines,
            style: TextStyle(
                fontSize: fontSize ?? SizeConst.base,
                color: color ?? ColorConst.black,
                fontWeight: fontWeight ?? FontWeight.w300
            ),
          )
        : new Text(
            title,
            textAlign: textAlign ?? TextAlign.center,
            style: TextStyle(
                fontSize: fontSize ?? SizeConst.base,
                color: color ?? ColorConst.black,
                fontWeight: fontWeight ?? FontWeight.w300),
          );
  }
}
