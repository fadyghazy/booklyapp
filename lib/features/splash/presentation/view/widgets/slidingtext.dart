
import 'package:flutter/material.dart';

class Slidingtext extends StatelessWidget {
  const Slidingtext({
    Key? key,
    required this.slidinganimation,
  }) : super(key: key);

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganimation,
      builder: (BuildContext context, Widget?_) {
        return SlideTransition(
            position:slidinganimation ,
            child:const  Text("Read Books For Free",textAlign: TextAlign.center,));
      },

    );
  }
}

