import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:mfw/core/page_scaffold.dart';

class BarcodeScan extends StatefulWidget {
  const BarcodeScan({Key key}) : super(key: key);

  @override
  _BarcodeScanState createState() => new _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String barcode = "";

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 500), () {
      scan();
    });
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
    return PageScaffold(
        barSettings: {
          'leftItems': {
            'leftItem0': {
              'type': 3,
              'onTap': null,
              'icon': Icons.keyboard_arrow_left
            }
          }
        },
        body: new Center(
            child: new Padding(
          padding: EdgeInsets.all(15.0),
          child: new Text(barcode),
        )));
  }
}
