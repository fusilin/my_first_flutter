import 'package:flutter/material.dart';

// 分割线：竖线分割线，横线分割线
class DividingLine extends StatelessWidget {
  const DividingLine({
    this.vertical,
    this.height,
    this.width,
    this.leftSpace,
    this.rightSpace,
    this.color,
  });
  final bool vertical;
  final double height;
  final double width;
  final double leftSpace;
  final double rightSpace;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height ?? 1.0,
      width: width ?? MediaQuery.of(context).size.width,
      color: Colors.white,
      child: new Container(
        margin: vertical == null
            ? EdgeInsets.only(left: leftSpace ?? 15.0, right: rightSpace ?? 0.0)
            : EdgeInsets.all(0.0),
        color: color ?? new Color.fromARGB(255, 242, 242, 245),
      ),
    );
  }
}

// Container DividingLine(
//     double height, double leftIndent, double rightIndent, Color color) {
//   return new Container(
//     height: height ?? 1.0,
//     // width: MediaQuery.of().size.width,
//     color: Colors.white,
//     child: new Container(
//       margin:
//           EdgeInsets.only(left: leftIndent ?? 15.0, right: rightIndent ?? 0.0),
//       color: color ?? new Color.fromARGB(255, 242, 242, 245),
//     ),
//   );
// }
