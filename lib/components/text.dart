import 'package:flutter/material.dart';
import 'dart:ui';

class MText extends StatelessWidget {
  const MText(
      {Key key,
      @required this.title,
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
    return new Text(
      title ?? ' ',
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          fontSize: fontSize ?? 14.0,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
