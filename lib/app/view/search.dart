import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

// const String _markdownData = "";

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  String barcode = "";

  @override
  void initState() {
    super.initState();
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: Icon(Icons.clear),
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
        title: Text('搜索', style: TextStyle(fontSize: 20.0)),
      ),
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      // 运行没效果
      // body: const Markdown(data: _markdownData),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new MaterialButton(
                  onPressed: scan,
                  color: Colors.grey[400],
                  child: new Text("扫描")),
              padding: const EdgeInsets.all(6.0),
            ),
            new Padding(
              padding: EdgeInsets.all(15.0),
              child: new Text(barcode),
            ),
          ],
        ),
      ),
      floatingActionButton: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              final RenderBox box = context.findRenderObject();
              Share.share('哈哈',
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
            },
            child: new Icon(Icons.share),
            heroTag: 'share0',
          )
        ],
      ),
    );
  }
}
