
import 'package:booklyappproject/core/widgets/custom_book_image.dart';
import 'package:booklyappproject/core/widgets/custom_loading_indicator.dart';
import 'package:booklyappproject/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context, state) {

        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:state.books.length,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??'',

                    ),

                  ),),

          );
        }else if(state is SimilarBooksFailure){
          return ErrorWidget(state.errMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      }
    );
  }
}
