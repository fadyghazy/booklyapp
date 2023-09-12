
import 'package:flutter/material.dart';

import '../../../constants.dart';
class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color;
  final Color  textcolor;
  const RoundedButton({
    Key? key, required this.text, required ,this.color=KPrimaryColor,this.textcolor=Colors.white,required this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),

      width: size.width*0.8,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary:color,shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

          )),
          onPressed:press,


          child: Text(text,style: TextStyle(color:textcolor),)),
    );
  }
}
