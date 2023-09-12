
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:booklyappproject/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../intro/intro_view.dart';
class BookSplashView extends StatelessWidget {
  const BookSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(

      splash: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(AppAssets.KBackgroundImage,fit:BoxFit.cover),
        ),
      ),
      splashIconSize: double.infinity,
      duration: 2000,
      nextScreen: const IntroductionPageView(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );


  }
}
