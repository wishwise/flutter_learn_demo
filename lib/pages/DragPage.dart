import 'package:flutter/material.dart';

import '../Drag.dart';

class DragPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("images"),
      //   ),
      body: Center(
        child: Drag(),
        ),
    );
  }
}