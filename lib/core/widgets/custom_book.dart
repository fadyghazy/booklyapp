
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.backgroundcolor, required this.textcolor, this.borderRadius, this.fontSize, required this.text, this.onPressed});
final Color backgroundcolor;
final Color textcolor;
final BorderRadius?borderRadius;
final double ?fontSize;
final String text;
final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child:
        TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:borderRadius?? BorderRadius.circular(16),

        ),
        backgroundColor:backgroundcolor ,
      ),
      onPressed:onPressed, child: Text(text,style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w900,color: textcolor,fontSize: fontSize)),

        )
    );
  }
}
