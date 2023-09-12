
import 'package:booklyappproject/core/widgets/custom_book_image.dart';
import 'package:booklyappproject/features/home/data/model/book_model/book_model.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/book_action.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookmodel}) : super(key: key);
 final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.2),
          child: CustomBookImage(imageUrl:bookmodel.volumeInfo.imageLinks?.thumbnail??'',

          ),
        ),
        const SizedBox(height:43 ,),
         Text(bookmodel.volumeInfo.title!,style: Styles.textStyle20,textAlign: TextAlign.center,),
        const SizedBox(height: 5),
         Text(bookmodel.volumeInfo.authors?[0]??'',style: Styles.textStyle14),
         BookRating(rating: bookmodel.volumeInfo.averageRating??0, count: bookmodel.volumeInfo.ratingsCount??0),
        const SizedBox(height: 37,),
        BooksAction(bookmodel: bookmodel,)


      ],
    );
  }
}
