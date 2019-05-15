import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:mfw/components/text.dart';
import 'package:mfw/style/size.dart';
import 'package:provide/provide.dart';
import 'package:mfw/provide/provide.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar(
      {this.titleOpacity,
      this.barSettings,
      this.height,
      this.color,
      this.equalFlex});

  final int titleOpacity;
  final Object barSettings;
  final double height;
  final Color color;
  final int equalFlex;

  Size get preferredSize {
    return new Size.fromHeight(height ?? 48.0);
  }

  State<StatefulWidget> createState() {
    return new AppBarState();
  }
}

class AppBarState extends State<MyAppBar> {
  var titleItems;
  var leftItems;
  var rightItems;
  var titleStyle;
  var style;

  @override
  void initState() {
    super.initState();
    getNavigateBarParams(widget.barSettings);
    Provide<ConfigProvide>(builder: (context, child, configProvide) {
      configProvide.changeTitleOpacity(
          widget.titleOpacity == null ? 155 : widget.titleOpacity);
    });
  }

  @override
  void dispose() {
    super.dispose();
    Provide<ConfigProvide>(builder: (context, child, configProvide) {
      configProvide.changeTitleOpacity(0);
    });
  }

  void getNavigateBarParams(barSettings) {
    if (barSettings == null) return;
    barSettings.forEach((key, value) {
      if (key == 'title') {
        titleItems = value;
      } else if (key == 'leftItems') {
        leftItems = value;
      } else if (key == 'rightItems') {
        rightItems = value;
      }
    });
  }

  List<Widget> setNavigateBar(provide) {
    List<Widget> _widget = <Widget>[];
    _widget.add(new Expanded(
      flex: 1,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: handleNavigateBar(leftItems),
      ),
    ));
    if (titleItems != null) {
      _widget.add(
        new Expanded(
            flex: widget.equalFlex != null ? 1 : 2,
            child: MText(
                title: titleItems['text'],
                maxLines: 1,
                color: Color.fromARGB(provide.titleOpacity, 0, 0, 0))),
      );
    }
    _widget.add(new Expanded(
        flex: 1,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: handleNavigateBar(rightItems),
        )));

    return _widget;
  }

  ///**
  /// headerBar type = 1:文本，type = 2:image, type=3:icon onTap:点击事件
  /// leftItems: null 表示默认返回
  /// rightItems
  ///**
  ///
  List<Widget> handleNavigateBar(items) {
    List<Widget> _widget = <Widget>[];
    if (items != null && items.length > 0) {
      items.forEach((key, item) {
        _widget.add(new InkWell(
          onTap: () {
            item['onTap'] != null
                ? Navigator.pushNamed(context, item['onTap'])
                : Navigator.pop(context);
          },
          child: new Padding(
              padding: EdgeInsets.all(7.5),
              child: item['type'] == 1
                  ? MText(
                      title: item['text'],
                      maxLines: 1,
                      fontSize: SizeConst.px16)
                  : (item['type'] == 2
                      ? new Image.asset(
                          item['image'] ?? 'assets/images/icon_arrow_left.png',
                          height: 22.0,
                          width: 22.0)
                      : Icon(
                          item['icon'],
                          size: 22.0,
                        ))),
        ));
      });
    }
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ConfigProvide>(builder: (context, child, provide){
      print('实际statusHeight:  ${provide.statusHeight}');
      return new Container(
        padding:
        EdgeInsets.only(top: provide.statusHeight, left: 7.5, right: 7.5),
        height: (widget.height ?? 48.0) + provide.statusHeight,
        color: widget.color ?? new Color.fromARGB(255, 250, 220, 76),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: setNavigateBar(provide),
        ),
      );
    });
  }
}
