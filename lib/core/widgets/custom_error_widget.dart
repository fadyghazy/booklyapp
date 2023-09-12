
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CutsomErrorWidget extends StatelessWidget {
  const CutsomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
 final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: Styles.textStyle18,textAlign:TextAlign.center,));
  }
}
