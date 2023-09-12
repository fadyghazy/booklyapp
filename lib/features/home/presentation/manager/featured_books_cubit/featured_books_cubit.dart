
import 'package:booklyappproject/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/homerepo.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  // استدعيت الhome repo  عشان استدعى الmehods بتاعتى بداخل HomeRepo
Future<void>fetchFeaturedBooks()async{
  //هنا انا حبتدى واستخدم ال homerepo بتاعتى
  // وابتدى اعمل method عشان اعمل manage لل states  الخاصه بال fetch Featured Books بتاعتى
  // اولا فى حاله انى حعمل fetchFeaturedBooks فى البدايه عندى بيحصل loading وقت لما بعمل fetch لل data
  emit(FeaturedBooksLoading());
  // بعد كدة حستخدم الhomerepoo بتاعتى عشان استدعى الmethod بتاعت  fetchFeaturedBooks
  var result =await homeRepo.fetchFeaturedBooks();
  // بما ان الresult عبارة عن  either object
  // بيوفرلك method تسمى fold وبترجعلك  حالتين حاله الfailure وحاله الsuccess
   result.fold((failure) {
     // فى حاله ان الresult اللى جايلى من الrequest اللى عملته ود عليا ب failure  حيرجعلى  errorMessage
     emit(FeaturedBooksFailure(failure.errorMessage));

   } , (books) => emit(FeaturedBooksSuccess(books)));
   // هنا انا بمجرد بعمل handle لل states بتاعت الui يعنى انا مش بجيب data لا انا بستخدم الdata اللى جايلى عشان اعمل handle states بتاعت الui وطبعا هنا انا عملت create لل featured books Method



}

}
