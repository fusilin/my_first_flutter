// import 'package:flutter/material.dart';

// import 'theme.dart';
// class DividerLine extends StatelessWidget {
//   const DividerLine(
//       {Key key, this.height, this.leftIndent, this.rightIndent, this.color})
//       : super(key: key);
//   final double height;
//   final double leftIndent;
//   final double rightIndent;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: height ?? 1.0,
//       color: new Color.fromARGB(255, 242, 242, 245),
//       child: new Container(
//         margin: EdgeInsets.only(
//             left: leftIndent ?? 15.0, right: rightIndent ?? 0.0),
//         color: color ?? new Color.fromARGB(255, 242, 242, 245),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

Container DividerLine(
    double height, double leftIndent, double rightIndent, Color color) {
  return new Container(
    height: height ?? 1.0,
    color: Colors.white,
    child: new Container(
      margin:
          EdgeInsets.only(left: leftIndent ?? 15.0, right: rightIndent ?? 0.0),
      color: color ?? new Color.fromARGB(255, 242, 242, 245),
    ),
  );
}
