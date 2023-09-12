
import 'package:booklyappproject/core/widgets/custom_loading_indicator.dart';
import 'package:booklyappproject/features/home/presentation/manager/newsest_books_cubit/newest_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/manager/newsest_books_cubit/newest_books_state.dart';
import 'package:booklyappproject/features/home/presentation/view/widgets/newest_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<NewestBooksCubit,NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: state.books.length,
              itemBuilder: (context, index) =>
               Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: NewestListViewItem(book: state.books[index],),
              ),
            );
          }else if (state is NewestBooksFailure){
            return ErrorWidget(state.errMessage);
          }
          else {
            return const CustomLoadingIndicator();
          }
        }
      )
    );

  }
}
