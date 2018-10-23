import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

class BarcodeScan extends StatefulWidget {
  const BarcodeScan({Key key}) : super(key: key);

  @override
  _BarcodeScanState createState() => new _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String barcode = "";
  @override
  void initState() {
    scan();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              icon: Icon(Icons.keyboard_arrow_left),
              iconSize: 24.0,
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0.0,
        ),
        backgroundColor: new Color.fromARGB(255, 242, 242, 245),
        body: new Center(
            child: new Padding(
          padding: EdgeInsets.all(15.0),
          child: new Text(barcode),
        )));
  }
}
