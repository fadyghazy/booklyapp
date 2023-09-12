
import 'package:flutter/material.dart';

void CustomSnackBar(context,String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}