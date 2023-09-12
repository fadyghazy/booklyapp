
import 'package:booklyappproject/features/home/presentation/view/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("You can also like",style: Styles.textStyle14.copyWith(fontWeight:FontWeight.w600),),
        const SizedBox(height: 16,),
        const SimilarBooksListView()
      ],
    );
  }
}
