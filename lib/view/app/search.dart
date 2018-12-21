import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:scoped_model/scoped_model.dart';
import 'package:mfw/model/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  RefreshController _refreshController;
  ValueNotifier<double> topOffsetLis = new ValueNotifier(0.0);
  ValueNotifier<double> bottomOffsetLis = new ValueNotifier(0.0);
  List<Widget> initData = [];

  Widget _buildHeader(context, mode) {
    return new ClassicIndicator(
      mode: mode,
      idleText: '下拉刷新',
      releaseText: '释放刷新',
      refreshingText: '正在刷新',
      completeText: '',
    );
  }

  Widget _buildFooter(context, mode) {
    return new ClassicIndicator(
      mode: mode,
    );
  }

  void _onOffsetCallback(bool isUp, double offset) {
    if (isUp) {
      topOffsetLis.value = offset;
    } else {
      bottomOffsetLis.value = offset;
    }
  }

  void buildPageContent() {
    initData.add(new Container(
      color: new Color.fromARGB(255, 250, 250, 250),
      child: new Card(
        margin:
            new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: new Center(
          child: new Text('Data'),
        ),
      ),
    ));
//    initData.add(new Container(
//      padding: EdgeInsets.only(
//          top: ScopedModel
//              .of<GlobalModel>(context)
//              .statusHeight,
//          left: 15.0,
//          right: 15.0),
//      height: 48.0 + ScopedModel
//          .of<GlobalModel>(context)
//          .statusHeight,
//      color: Color(0xffffffff),
//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          new Expanded(
//            flex: 1,
//            child: new Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Padding(
//                      padding: EdgeInsets.all(0.0),
//                      child: new InkWell(
//                        onTap: () {
//                          Fluttertoast.showToast(msg: '待完善');
//                        },
//                        child: new Padding(
//                          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
//                          child: new Image.asset(
//                              'assets/images/icon_message.png',
//                              height: 24.0,
//                              width: 24.0),
//                        ),
//                      ))
//                ]),
//          ),
//          new Expanded(
//              flex: 2,
//              child: new Container(
//                height: 30.0,
//                color: Color(0xffff0000),
//                child: new Text('哈哈'),
//              )),
//          new Expanded(
//            flex: 1,
//            child: new Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Padding(
//                      padding: EdgeInsets.all(0.0),
//                      child: new InkWell(
//                        onTap: () {
//                          Fluttertoast.showToast(msg: '待完善');
//                        },
//                        child: new Padding(
//                          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
//                          child: new Image.asset(
//                              'assets/images/icon_message.png',
//                              height: 24.0,
//                              width: 24.0),
//                        ),
//                      ))
//                ]),
//          ),
//        ],
//      ),
//    ));
  }

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    buildPageContent();
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  Widget contentScrollView(context, model) {
    return new SmartRefresher(
        enablePullUp: true,
        controller: _refreshController,
        headerBuilder: _buildHeader,
        footerBuilder: _buildFooter,
        headerConfig: new RefreshConfig(
          triggerDistance: 60.0,
        ),
        onRefresh: (up) {
          if (up) {
            new Future.delayed(const Duration(milliseconds: 2000)).then((val) {
              _refreshController.sendBack(true, RefreshStatus.completed);
            });
          } else {
            new Future.delayed(const Duration(milliseconds: 2000)).then((val) {
              _refreshController.sendBack(false, RefreshStatus.failed);
            });
          }
        },
        onOffsetChange: _onOffsetCallback,
        child: new ListView.builder(
          itemExtent: 100.0,
          itemCount: initData.length,
          itemBuilder: (context, index) {
            return initData[index];
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<GlobalModel>(builder: (context, child, model) {
      return new CustomScrollView(
        slivers: <Widget>[contentScrollView(context, model)],
      );
    });
  }
}
