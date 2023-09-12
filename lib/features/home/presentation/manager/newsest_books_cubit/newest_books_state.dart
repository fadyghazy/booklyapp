import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';
  //Create Newest Books Cubit States
abstract class NewestBooksState extends Equatable{
  // هنا انا بنشا اول cubit عندى عشان اعمل handle لل featured books
  const NewestBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NewestBooksInitial extends NewestBooksState{
// طبعا انى احدد الstates بتاعت الfeatured books
 // فى حاله انك بت fetch data من على النت فانت بيبقى عندك 3 states وهى عبارة عن state ب تقولك انك بتعمل Load لل data دلوقتى وstate بتقولك انك خلاص جبت ال data بشكل سليم وstate بتقولك ان حصل مسكله عندك وانت بت fetch ال data من على النت

}
class NewestBooksLoading extends NewestBooksState{}
class NewestBooksFailure extends NewestBooksState{
  // فى حاله الfailure دة حيشيل الerrormessage بتاعته عشان اعرضها لل user
  final  String errMessage;

 const NewestBooksFailure(this.errMessage);
}
class NewestBooksSuccess extends NewestBooksState{
  // فى  success state يوجد اختيارين وهما 1- اخلى الdata اللى جاتلى بالفعل من النت عايشه فى الcubit دات نفسه او تجيلى من خلال الsuceess state فانا بختار على اساس انا حعرض البيانات فين
  //       انا لو حعرض البيانات جوة list يعنى يدوب حديها لل list على طول فخلاص حستقبلها فى الsuccess state فانا هنا يا شباب بعتمد على انى حعرض البيانات فين وعلى اساسها بحدد هل انا حستقبل البيانات جوة success state ولا حستقبلها جوة الcubit دات نفسه يعنى انا دلوقتى مثلا لو انا حعرض البيانات جوة List فعلى طول خلاص يعنى انا جوة الlist يدوب حاخد البيانات من الSuccess state وحبعتها
  // لل list على طول وخلص الموضوع على كدة
  // لكن فى حاله ان عندى مجموعه widgets كتيرة جدا فانا محتاج انى ابعت لكل widget من دول البيانات اللى جايالى من الsuccess state فطبعا كدة حضطر انشا كل شويه متغير وابعته لل   constructor وهكدا فالموضوع دة بيبقى ممل طبعا فانا بخليها جوة الcubit على طول ولو عايز اعملها access بعملها access من خلال ال cubit وبما انى بتعامل مع list  فافضل مكان احط فيه الdata   جوة ال success state
  final List<BookModel>books;

 const  NewestBooksSuccess(this.books);
}
// كدة انا انشات الstates بتاعتى الخاصه بال  featured books
// create featured books states