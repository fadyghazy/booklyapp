
import 'package:booklyappproject/core/widgets/custom_loading_indicator.dart';
import 'package:booklyappproject/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
      child: BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
         builder: (context,state){

      if(state is FeaturedBooksSuccess){
        return SizedBox(
            height: MediaQuery.of(context).size.height*.3,
            child:
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context,index)=>

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.KDetailsView,extra:state.books[index]);
                        },
                          child: FeaturedListViewItem(imageurl:state.books[index].volumeInfo.imageLinks?.thumbnail??'',)),
                    )));
      }else if(state is FeaturedBooksFailure){
        return CutsomErrorWidget(errorMessage:state.errMessage);
      }else{
        return CustomLoadingIndicator();
      }
         }
        ),
    );
  }
}
