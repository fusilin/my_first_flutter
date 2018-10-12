import 'package:flutter/material.dart';

class FindTab extends StatefulWidget {
  FindTabState createState() => new FindTabState();
}

class FindTabState extends State<FindTab> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.touch_app),
              heroTag: 'test2',
            ),
          )
        ],
      ),
    );
  }
}
