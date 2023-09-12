
import 'package:booklyappproject/constants.dart';
import 'package:booklyappproject/features/home/data/model/book_model/book_model.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/Book_details_section.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/book_rating.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/custom_Details_App_bar.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_book.dart';
import 'featured_list_view_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,


      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KPadding),
        child: Column(
          children: [
             const CustomDetailsBooksAppBar(),
             BookDetailsSection(bookmodel: bookModel),
             const Expanded(child: SizedBox(height: 50)),
            const SimilarBooksSection(),
            const SizedBox(height: 40),

          ],
        ),
      ),
    )]
    );
  }
}