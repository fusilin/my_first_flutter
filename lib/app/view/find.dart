import 'package:flutter/material.dart';
// import 'package:flutter_wechat/flutter_wechat.dart';
import 'package:fluwx/fluwx.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class FindTab extends StatefulWidget {
  FindTabState createState() => new FindTabState();
}

class FindTabState extends State<FindTab> {
  static const String _imgUrl =
      'https://avatars2.githubusercontent.com/u/33337793?s=460&v=4';
  static const String _webpageUrl =
      'https://github.com/fusilin/my_first_flutter';
  static const String _title = 'my_first_flutter';
  static const String _description = 'github';
  static const int _type = 0; // 0 聊天页面 1 朋友圈
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _share() async {
      // await FlutterWechat.shareWebPage(
      //   imgUrl: _imgUrl,
      //   webpageUrl: _webpageUrl,
      //   title: _title,
      //   description: _description,
      //   type: _type,
      // );
      // var model = new WeChatShareMiniProgramModel(
      //     webPageUrl: _webpageUrl,
      //     miniProgramType:
      //         WeChatShareMiniProgramModel.MINI_PROGRAM_TYPE_RELEASE,
      //     userName: _title,
      //     title: _title,
      //     description: _description,
      //     thumbnail: _webpageUrl);
      // fluwx.share(model);
      fluwx.share(WeChatShareTextModel(
          text: "text from fluwx", transaction: "transaction}", scene: WeChatScene.SESSION));
    }

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text('发现', style: TextStyle(fontSize: 20.0)),
      ),
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      // body: new Center(child: new InkWell()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            child: new Text(
              '地图',
              style: TextStyle(color: Colors.green, fontSize: 14.0),
            ),
            heroTag: 'test1',
            tooltip: 'test1',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () => _share(),
              child: const Icon(Icons.touch_app),
              heroTag: 'test2',
              tooltip: 'test2',
            ),
          )
        ],
      ),
    );
  }
}
