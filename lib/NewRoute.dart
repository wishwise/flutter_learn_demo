import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageAndIconRoute.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("images"),
      ),
      body: Center(
        child: ImageAndIconRoute(),
      ),
    );
  }
}