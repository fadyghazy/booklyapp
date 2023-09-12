
import 'package:booklyappproject/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({this.mainAxisAlignment=MainAxisAlignment.center,required this.rating, required this.count});
  final num rating;
  final int count;
 final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar,size: 20,
            color:Colors.amberAccent),
        const SizedBox(width:6.3),
         Text(rating.toString(),style:Styles.textStyle14 ),
        const SizedBox(width:4),
        Opacity(
          opacity: .5,
            child: Text("$count",style: Styles.textStyle14.copyWith()))



      ],
    );
  }
}
