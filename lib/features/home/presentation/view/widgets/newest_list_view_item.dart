
import 'package:booklyappproject/core/utils/assets.dart';
import 'package:booklyappproject/core/widgets/custom_book_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/model/book_model/book_model.dart';
import 'book_rating.dart';

class NewestListViewItem extends StatelessWidget {
  const NewestListViewItem({Key? key, required this.book}) : super(key: key);
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.KDetailsView,extra: book);
      },
      child: SizedBox(
        height: 125,
        child:
        Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
        CustomBookImage(imageUrl: book.volumeInfo.imageLinks?.thumbnail??''),
        const SizedBox(width: 10),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width*0.5,
                 child: Text(book.volumeInfo.title!,style:Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),maxLines: 2,
                 overflow: TextOverflow.ellipsis),
               ), const SizedBox(width: 2.5),
               Text(book.volumeInfo.authors![0],style: Styles.textStyle14.copyWith(color: Colors.grey),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
               Text("Free",style:Styles.textStyle18.copyWith(fontWeight: FontWeight.w600) ,



                 ),
                  BookRating(rating:book.volumeInfo.averageRating?.round()??0, count:book.volumeInfo.ratingsCount??0,),
      ]
               ),




             ],
           ),
         )


        ],

        )
      ),
    );
  }
}