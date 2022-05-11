import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointerMoveIndicator extends StatefulWidget{
  @override
  _PointerMoveIndicatorState createState() => _PointerMoveIndicatorState();

}
class _PointerMoveIndicatorState extends State<PointerMoveIndicator> {
  PointerEvent? _event;
  PointerEvent? _eventdown;
  PointerEvent? _eventup;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_eventdown?.localPosition ?? ''} ${_event?.localPosition ?? ''} ${_eventup?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _eventdown = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _eventup = event),
    );
  }
}