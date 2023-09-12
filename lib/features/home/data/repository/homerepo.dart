import 'package:booklyappproject/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../model/book_model/book_model.dart';

abstract class HomeRepo{
  // بيديلك نظرة عامه ايه اللى بيحصل فى الfeature بتاعتك
  // وممكن تنفد ال methods اللى بداخله باكتر من طريقه
   // وبردة بخليه عندى عشان يكون عندى class  فيه كل الmethods اللى بيتم تنفيدها بداخل الfeature
  // فكدة بسهوله جدا لو روحت على اى feature حروح على الrepo بتاعتها حفهم على طول الfeature بتعمل ايه فالfeature دى بتجيب ال featured books best seller books w
  Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>>  fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>  fetchSimilarBooks({required String category});
// المفروض اننا حننشا الimplementation الخاصه بال methods اللى احنا انشاناها جوة الhomerepo
// فحروح على الrepository زحمشا file جديد يسمى home_repo.implementation.dart






}