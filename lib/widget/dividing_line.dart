import 'package:flutter/material.dart';

Container DividingLine(Color _color, double top) {
  return new Container(
      height: top ?? 10.0,
      color: (_color ?? new Color.fromARGB(255, 242, 242, 245)));
}
