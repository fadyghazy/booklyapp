
import 'package:booklyappproject/core/utils/functions/launch_url.dart';
import 'package:booklyappproject/core/widgets/custom_book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookmodel}) : super(key: key);
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
         const Expanded(child: CustomButton(
            text: 'Free', backgroundcolor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16)
                  ,bottomLeft: Radius.circular(16),

            ),
            textcolor: Colors.black,
          )),
          Expanded(child: CustomButton(
            onPressed: (){
              launchCustomUrl(context, bookmodel.volumeInfo.previewLink);
            },
            text: gettext(bookmodel),fontSize: 16, backgroundcolor:const Color(0xffEF8262),
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(16)
              ,bottomRight: Radius.circular(16),

            ),
            textcolor: Colors.white,
          )),
        ],
      ),
    );
  }

 String gettext(BookModel bookmodel) {
    // فى هدة الmethod بعمل check على الurl وجود قيمه لل previewlink ولا لا لو موجود فاعمل عرض لل button Action يحتوى على text preview ومنها اقدر اعمل preview لل url اللى راجعلى ولو مفيش url راجعلى ساعتها اعرض فى الbutton action not available text
    if(bookmodel.volumeInfo.previewLink==null){
       return 'Not Available ';
    }
    else {
      return 'Preview';
    }
 }
}
