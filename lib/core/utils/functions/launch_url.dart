import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_Snck_Bar.dart';
 //كدة اصبح عندنا method جاهزة بتعمل handle لعمليه الlaunching url ولو فيه مشكله بتعرضلنا snackbar لطيفه بتقولنا ان فيه مشكله
Future<void>launchCustomUrl(context,String? url)async {
 // ودلوقتى خليت قيمه الurl ب null عشان اعمل check عليها لو كانت القيمه ب null ساعتها مش حعرض حاجه ولا حعمل launch لان مفيش url انما لو يوجد url ساعتها حعمل launch لل url اللى جايلى
  if(url!=null){
    Uri uri=Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }else{
      CustomSnackBar(context,'Cannot Launch $url');
    }
  }
}
