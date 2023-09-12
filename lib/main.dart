import 'package:booklyappproject/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'features/home/presentation/view/home_view.dart';
import 'myapplication.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApplication());
}
