import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DioRequest.dart';

class DioRequestPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DIO请求"),
      ),
      body: Center(
        child: Diorequest(),
      ),
    );
  }

}