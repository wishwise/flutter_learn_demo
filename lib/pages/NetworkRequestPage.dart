import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HttpTestRoute.dart';

class NetworkRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: Center(
        child: HttpTestRoute(),
      ),
    );
  }
}