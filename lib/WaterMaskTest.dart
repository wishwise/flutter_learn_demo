// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class WaterMaskTest extends StatelessWidget {
//   const WaterMaskTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         wChild(1, Colors.white, 200),
//         WaterMark(
//           painter: TextWaterMarkPainter(text: 'wendux', rotate: -20),
//         ),
//       ],
//     );
//   }
//
//   Widget wChild(int index, color, double size) {
//     return Listener(
//       onPointerDown: (e) => print(index),
//       child: Container(
//         width: size,
//         height: size,
//         color: Colors.grey,
//       ),
//     );
//   }
// }