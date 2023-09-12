
import 'package:booklyappproject/core/utils/assets.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/CustomAppbar.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import 'newest_list_view.dart';
import 'featured_list_view.dart';
import 'featured_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
    padding:  const EdgeInsets.symmetric(horizontal: 10,vertical:20 ),
    child: Column(
    crossAxisAlignment:CrossAxisAlignment.start ,
    children:   [
    const CustomAppBar(),
    const FeaturedListView(),
    const  SizedBox(height: 20),
    Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10) ,
        child: Text("Newest Books",style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500))),

          ]
        )
    )
        ),const SliverFillRemaining(



        child:  Padding(
              padding:EdgeInsets.symmetric(horizontal: 10) ,
              child:
          NewestListView(),

        )
        )
      ],
















        );

  }
}