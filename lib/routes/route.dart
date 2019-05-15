import 'package:flutter/material.dart';
import 'package:mfw/app.dart';
import 'package:mfw/view/mine/barcode_scan.dart';
import 'package:mfw/view/mine/setting.dart';
import 'package:mfw/view/mine/message.dart';
import 'package:mfw/view/mine/home_page.dart';

Map<String, WidgetBuilder> routes =  <String, WidgetBuilder>{
'/mfwApp': (context) => MfwApp(),
'/barcodeScan': (context) => BarcodeScan(),
'/setting': (context) => Setting(),
'/message': (context) => Message(),
'/homePage': (context) => HomePage(),
};