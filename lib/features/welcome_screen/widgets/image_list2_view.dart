import 'dart:async';
import 'dart:math';
import 'package:booklyappproject/core/widgets/custom_loading_indicator.dart';
import 'package:booklyappproject/features/home/presentation/manager/newsest_books_cubit/newest_books_cubit.dart';
import 'package:booklyappproject/features/home/presentation/manager/newsest_books_cubit/newest_books_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_error_widget.dart';
import '../../home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../home/presentation/manager/featured_books_cubit/featured_books_state.dart';
class ImageListView2 extends StatefulWidget {
  final int startIndex;
  const ImageListView2({
    required this.startIndex,
  });

  @override
  State<ImageListView2> createState() => _ImageListView2State();


}

class _ImageListView2State extends State<ImageListView2> {
  final _scrollController=ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (!_scrollController.position.atEdge) {
        _autoScroll();
      }
      // adding to List
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
    super.initState();
  }
  void _autoScroll(){
    final currentScrollPosition=_scrollController.offset;
    final scrollEndPosition =_scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(currentScrollPosition==scrollEndPosition?0:scrollEndPosition, duration: const Duration(seconds:20), curve:Curves.linear);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:1.96*pi,
      child: BlocBuilder<NewestBooksCubit,NewestBooksState>(
          builder: (context,state){

            if(state is NewestBooksSuccess) {
              return SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.60,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.60,
                child: ListView.builder(
                    itemCount: state.books.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 8.0, left: 8.0, top: 10.0),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.40,
                          child: AspectRatio(
                              aspectRatio: 2.6 / 4,

                              child: CachedNetworkImage(
                                imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'', fit: BoxFit.cover,
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.40,

                              )
                          ),
                        ),
                      );
                      /* Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      image: DecorationImage(image: NetworkImage(
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              ""
                      ), fit: BoxFit.cover,

                      )
                  ),
                  margin: const EdgeInsets.only(
                      right: 8.0, left: 8.0, top: 10.0),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.40,

                );*/
                    }),
              );
            }else if(state is NewestBooksFailure){
              return CutsomErrorWidget(errorMessage:state.errMessage,);
            }
            else{
              return const CustomLoadingIndicator();
            }
          }
      ),

    );
  }
}
