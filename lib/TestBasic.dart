import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestBasic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("Hello world"*2,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: Paint()..color=Colors.yellow,
          decoration:TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
      ),
    );
  }

}