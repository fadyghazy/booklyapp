
import 'package:booklyappproject/core/utils/app_router.dart';
import 'package:booklyappproject/core/utils/assets.dart';
import 'package:booklyappproject/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../constants.dart';
import 'slidingtext.dart';

class BookSplashScreenView extends StatefulWidget {
  const BookSplashScreenView({Key? key}) : super(key: key);

  @override
  State<BookSplashScreenView> createState() => _BookSplashScreenViewState();
}
class _BookSplashScreenViewState extends State<BookSplashScreenView>with SingleTickerProviderStateMixin {
  late Animation <Offset>slidinganimation;
 late  AnimationController animationController;
 @override
  void initState() {
   InitSlidingAnimation();
   navigateToScreen();
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(AppAssets.KBackgroundImage,fit:BoxFit.cover),

        ),
      ),
    );
  }
  void navigateToScreen(){
    Future.delayed(const Duration(seconds: 2), () {
    /*  Get.to(() => const HomeView(), transition: Transition.fade,
          duration: KTransitionDuration);
          G
   */  GoRouter.of(context).push(AppRouter.KIntroView);
    });
  }
  void InitSlidingAnimation(){

    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 3));
    slidinganimation=Tween(begin: Offset(0,2),end:Offset.zero).animate(animationController);
    animationController.forward();
  }
}
