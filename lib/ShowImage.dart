import 'package:flutter/cupertino.dart';

class ShowImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // return DecoratedBox(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: AssetImage('assets/images/1.jpg'),
    //
    //       ),
    //     )
    // );
    return Image.asset('assets/images/1.jpg',width: 35,height: 35,);
  }

}