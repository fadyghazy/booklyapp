/*
import 'package:booklyappproject/core/utils/app_router.dart';
import 'package:booklyappproject/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants.dart';
import 'widgets/Roundedbutton.dart';
import 'widgets/image_list2_view.dart';
import 'widgets/image_list_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       body: Stack(
         alignment:Alignment.center,
           children: [
             Positioned(
               top: -10,left:-150,child:Row(
               children: [
                 ImageListView1(startIndex:0),
                 ImageListView2(startIndex:1),
                 ImageListView1(startIndex:2),


               ],
             ),

             ),

             Positioned(
               bottom: 0,

                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*0.60,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: MediaQuery.of(context).size.height*0.3),
                         RoundedButton(
                           press: () {
                             GoRouter.of(context).push(AppRouter.KHomeView);
                          // Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const HomeView()), (route) => false);
                         }, text: 'Books Section ',color: KPrimaryLightColor,textcolor: Colors.black,)
                       ],
                     ),
                 ))
         //  BackgroundImage(image:AppAssets.Logo4),WelcomeViewBody(),

      ]
    )
    );
  }
}
*/