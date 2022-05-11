import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ScaleAnimationRoute.dart';

class ScaleAnimationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片动画缩放"),
      ),
      body: Center(
        child: ScaleAnimationRoute(),
      ),
    );
  }
}