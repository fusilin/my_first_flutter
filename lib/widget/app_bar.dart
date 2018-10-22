import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/view/model.dart';

class CustomTitleBarController extends ValueNotifier<ContomTitleAlphaValue> {
  CustomTitleBarController() : super(new ContomTitleAlphaValue());
}

class ContomTitleAlphaValue {
  int alpha;
}

/*
 * isHeaderGradient, // headr是否渐变,true表示渐变，false表示否
 * isTitleGradient, // tile是否渐变,true表示渐变，false表示否
 */
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar(
      {this.height,
      this.title,
      this.isHeaderGradient,
      this.isTitleGradient,
      this.rBColor,
      this.gBColor,
      this.bBColor,
      this.rColor,
      this.gColor,
      this.bColor,
      this.fontsize,
      this.leading,
      this.actions,
      this.lFlex,
      this.cFlex,
      this.rFlex});
  final double height;
  final String title;
  final bool isHeaderGradient;
  final bool isTitleGradient;
  final int rBColor;
  final int gBColor;
  final int bBColor;
  final int rColor;
  final int gColor;
  final int bColor;
  final double fontsize;
  final List<Widget> leading;
  final List<Widget> actions;
  final int lFlex;
  final int cFlex;
  final int rFlex;

  Size get preferredSize {
    return new Size.fromHeight(height ?? 48.0);
  }

  State<StatefulWidget> createState() {
    return new MyAppBarState();
  }
}

class MyAppBarState extends State<MyAppBar> {
  final double _paddingTop = MediaQueryData.fromWindow(window).padding.top;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(builder: (context, child, model) {
      return new Container(
        padding: EdgeInsets.only(top: _paddingTop, left: 15.0, right: 15.0),
        height: (widget.height ?? 48.0) + _paddingTop,
        color: widget.isHeaderGradient == true
            ? new Color.fromARGB(model.opacity, widget.rBColor ?? 250,
                widget.gBColor ?? 220, widget.bBColor ?? 76)
            : new Color.fromARGB(255, widget.rBColor ?? 250,
                widget.gBColor ?? 220, widget.bBColor ?? 76),
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
                    fontSize: widget.fontsize ?? 16.0,
                    color: widget.isTitleGradient == true
                        ? new Color.fromARGB(
                            model.titleOpacity,
                            widget.rColor ?? 0,
                            widget.gColor ?? 0,
                            widget.bColor ?? 0)
                        : new Color.fromARGB(255, widget.rColor ?? 0,
                            widget.gColor ?? 0, widget.bColor ?? 0),
                  ),
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
    });
  }
}
