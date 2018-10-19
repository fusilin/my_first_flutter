import 'package:flutter/material.dart';
import 'dart:ui';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    this.height,
    this.backgroundColor,
    this.title,
    this.color,
    this.fontsize,
    this.leading,
    this.actions,
    this.lFlex,
    this.cFlex,
    this.rFlex,
  });
  final double height;
  final String title;
  final Color backgroundColor;
  final Color color;
  final double fontsize;
  final List<Widget> leading;
  final List<Widget> actions;
  final int lFlex;
  final int cFlex;
  final int rFlex;

  Size get preferredSize {
    return new Size.fromHeight(height ?? 48.0);
  }

  State createState() {
    return new MyAppBarState();
  }
}

class MyAppBarState extends State<MyAppBar> {
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: _paddingTop, left: 15.0, right: 15.0),
      height: (widget.height ?? 48.0) + _paddingTop,
      color: widget.backgroundColor ?? new Color.fromARGB(255, 255, 230, 86),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            flex: widget.lFlex ?? 1,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: widget.leading),
          ),
          new Expanded(
              flex: widget.cFlex ?? 2,
              child: new Text(
                widget.title ?? ' ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget.fontsize ?? 15.0,
                    color: widget.color ?? Colors.black),
              )),
          new Expanded(
              flex: widget.rFlex ?? 1,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.actions,
              ))
        ],
      ),
    );
  }
}
