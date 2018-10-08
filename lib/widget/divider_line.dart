import 'package:flutter/material.dart';

// import 'theme.dart';
class DividerLine extends StatelessWidget {
  const DividerLine(
      {Key key, this.height, this.leftIndent, this.rightIndent, this.color})
      : super(key: key);
  final double height;
  final double leftIndent;
  final double rightIndent;
  final Color color;

  static BorderSide createBorderSide(BuildContext context,
      {Color color, double width = 0.0}) {
    assert(width != null);
    return new BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height ?? 1.0,
      color: Colors.white,
      child: new Container(
        margin: EdgeInsets.only(
            left: leftIndent ?? 15.0, right: rightIndent ?? 0.0),
        color: color ?? new Color.fromARGB(255, 242, 242, 245),
      ),
    );
  }
}
