import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lofter/app/view/search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';

import 'dart:async';
import 'package:flutter_refresh/flutter_refresh.dart';

const double _kMinFlingVelocity = 800.0;

class Photo {
  Photo({this.assetName});

  final String assetName;

  // String get tag => assetName; // Assuming that all asset names are unique.

  bool get isValid => assetName != null;
}

class GridPhotoViewer extends StatefulWidget {
  // const GridPhotoViewer({Key key, this.photo}) : super(key: key);

  const GridPhotoViewer({Key key, this.assertName}) : super(key: key);
  final String assertName;

  @override
  _GridPhotoViewerState createState() => new _GridPhotoViewerState();
}

class _GridPhotoViewerState extends State<GridPhotoViewer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _flingAnimation;
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // The maximum offset value is 0,0. If the size of this renderer's box is w,h
  // then the minimum offset value is w - _scale * w, h - _scale * h.
  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset =
        new Offset(size.width, size.height) * (1.0 - _scale);
    return new Offset(
        offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      // The fling animation stops if an input gesture starts.
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0);
      // Ensure that image location under the focal point stays in the same place despite scaling.
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity) return;
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = new Tween<Offset>(
            begin: _offset, end: _clampOffset(_offset + direction * distance))
        .animate(_controller);
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      child: new ClipRect(
        child: new Transform(
          transform: new Matrix4.identity()
            ..translate(_offset.dx, _offset.dy)
            ..scale(_scale),
          // child: new Image.network(widget.photo.assetName, fit: BoxFit.cover),
          child: new Image.network(widget.assertName, fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  // List<Photo> photos = <Photo>[
  //   new Photo(
  //       assetName:
  //           'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2097455549,1668468150&fm=27&gp=0.jpg')
  // ];

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {});
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {});
  }

  final List<Map<String, Object>> _items = [
    {
      'name': '人生，没有如果',
      'text':
          '曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。 如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。 如果非要在这份爱上加上一个期限，我希望是……一万年',
      'headImg':
          'http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg',
      'contentImg':
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2097455549,1668468150&fm=27&gp=0.jpg'
    },
    {
      'name': '人生，没有如果',
      'text':
          '曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。 如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。 如果非要在这份爱上加上一个期限，我希望是……一万年',
      'headImg':
          'http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg',
      'contentImg':
          'https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=2445157591,2916811101&fm=85&s=BC0316740D9270555E8A00C5030070AA'
    },
    {
      'name': '人生，没有如果',
      'text':
          '曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。 如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。 如果非要在这份爱上加上一个期限，我希望是……一万年',
      'headImg':
          'http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg',
      'contentImg':
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3005045204,184888181&fm=27&gp=0.jpg'
    },
    {
      'name': '人生，没有如果',
      'text':
          '曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。 如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。 如果非要在这份爱上加上一个期限，我希望是……一万年',
      'headImg':
          'http://imglf0.ph.126.net/NkGK253slpQ4qHIoHMPLWg==/6630433347490366965.jpg',
      'contentImg':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538900088408&di=6fcf1e57ba7e153d847a6a3c46712aa0&imgtype=0&src=http%3A%2F%2Fpic3.16pic.com%2F00%2F12%2F16%2F16pic_1216853_b.jpg'
    },
  ];
  final TextStyle _biggerFont =
      new TextStyle(fontSize: 18.0, color: Colors.black);

  // static const String routeName = '/material/tabs';
  Padding buildPadding(String label) {
    return new Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: new Text(label,
            style: new TextStyle(color: Colors.black, fontSize: 16.0)));
  }

  Column buildColumn(String number, String label) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Text(number, style: new TextStyle(fontSize: 14.0))),
        new Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: new Text(label, style: new TextStyle(fontSize: 13.0))),
      ],
    );
  }

  GestureDetector buildGestureDetector(IconData _icon, String _toastMsg) {
    return new GestureDetector(
      onTap: () => Fluttertoast.showToast(msg: '$_toastMsg'),
      child: new Container(
        color: Colors.white,
        padding: const EdgeInsets.only(right: 20.0),
        child: new Icon(_icon, size: 22.0, color: Color(0xffBBBBBB)),
      ),
    );
  }

  Widget attentionListView(context) {
    return new Refresh(
      onFooterRefresh: onFooterRefresh,
      onHeaderRefresh: onHeaderRefresh,
      childBuilder: (BuildContext context,
          {ScrollController controller, ScrollPhysics physics}) {
        return new Container(
            child: new ListView.builder(
                physics: physics,
                controller: controller,
                itemCount: _items.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.only(),
                    color: Colors.white,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  new MaterialPageRoute<void>(
                                      builder: (BuildContext context) {
                                return new Search();
                              }));
                            },
                            child: new Container(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, left: 15.0),
                              color: Colors.white,
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        new NetworkImage(_items[i]['headImg']),
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      buildPadding(_items[i]['name'])
                                    ],
                                  )
                                ],
                              ),
                            )),
                        new GestureDetector(
                            onTap: () =>
                                showPhoto(context, _items[i]['contentImg']),
                            child: new Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(0.0),
                                width: window.physicalSize.width,
                                // child: new Image.asset(_items[i]['contentImg'],
                                child: new Image.network(
                                    _items[i]['contentImg'],
                                    fit: BoxFit.fitWidth))),
                        // child: new Image.asset('assets/images/ic_mn.png',
                        //     fit: BoxFit.fitHeight))),
                        new GestureDetector(
                            onTap: () => Navigator.push(context,
                                    new MaterialPageRoute<void>(
                                        builder: (BuildContext context) {
                                  return new Search();
                                })),
                            child: new Container(
                              padding:
                                  // const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  const EdgeInsets.all(0.0),
                              color: Colors.white,
                              child: new Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: new Text(_items[i]['text'],
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500))),
                            )
                            // child: new Image.asset("assets/images/ic_mn.png", height: 180.0, fit: BoxFit.cover)),
                            ),
                        // new Divider(),
                        new GestureDetector(
                          onTap: () =>
                              Fluttertoast.showToast(msg: '大话西游话题页待完善'),
                          child: new Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10.0),
                            height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  color: Colors.grey[100],
                                  padding: EdgeInsets.all(5.0),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.link,
                                        size: 22.0,
                                        color: Color(0xffBBBBBB),
                                      ),
                                      new Text("大话西游",
                                          style: new TextStyle(
                                              color: Color(0xffBBBBBB),
                                              fontSize: 13.0)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          height: 2.0,
                          color: Colors.white,
                          child: new Image.asset(
                            'assets/images/dot.png',
                            fit: BoxFit.contain,
                            color: Colors.grey,
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.all(15.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  buildGestureDetector(
                                      Icons.favorite_border, '点赞待完善'),
                                  buildGestureDetector(Icons.message, '评论待完善'),
                                  buildGestureDetector(Icons.share, '分享待完善'),
                                  buildGestureDetector(Icons.thumb_up, '推荐待完善'),
                                ],
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  buildGestureDetector(
                                      Icons.more_horiz, 'modal待完善'),
                                ],
                              )
                            ],
                          ),
                        ),
                        new Container(
                            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Text("88热度",
                                    style: new TextStyle(
                                        color: Color(0xff888888),
                                        fontSize: 12.0)),
                              ],
                            )),
                        new Container(
                          color: new Color.fromARGB(255, 242, 242, 245),
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  );
                }));
      },
    );
  }

  void showPhoto(BuildContext context, String assertName) {
    Object tag = {
      "assertName":
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2097455549,1668468150&fm=27&gp=0.jpg'
    };
    Navigator.push(context,
        new MaterialPageRoute<void>(builder: (BuildContext context) {
      return new Scaffold(
        body: new SizedBox.expand(
          child: new Hero(
              tag: tag, child: new GridPhotoViewer(assertName: assertName)),
        ),
      );
    }));
  }

//  Widget _buildItem(i) {
//    if (_items[i]['img'] == null) {
//      return null;
//    }
//    // return
//  }

  Widget subscriptionListView(context) {
    return new Refresh(
      onFooterRefresh: onFooterRefresh,
      onHeaderRefresh: onHeaderRefresh,
      childBuilder: (BuildContext context,
          {ScrollController controller, ScrollPhysics physics}) {
        return new Container(
            child: new ListView(
                physics: physics,
                controller: controller,
                children: [
              new Center(
                child: new Text("暂没有订阅"),
              )
            ]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: new DefaultTabController(
            length: 2,
            child: new Scaffold(
              appBar: new TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: <Widget>[new Tab(text: "关注"), new Tab(text: "订阅")],
              ),
              backgroundColor: Colors.white,
              body: new TabBarView(children: <Widget>[
                attentionListView(context),
                subscriptionListView(context)
              ]),
            )));
  }
}
