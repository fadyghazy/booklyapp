
import 'package:booklyappproject/core/widgets/custom_book_image.dart';
import 'package:booklyappproject/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({Key? key, required this.imageurl}) : super(key: key);
   final String imageurl;
  @override
  Widget build(BuildContext context) {
    return CustomBookImage(imageUrl:imageurl);
  }
}
