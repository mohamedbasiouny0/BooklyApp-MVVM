import 'package:test2/features/home/data/models/book_details_model/book_details_model.dart';
import 'package:test2/features/home/data/models/similar_book_model/similar_book_model.dart';

abstract class BookDetailsRepo {
  Future<BookDetailsModel> getBookDetails({required int id});
  Future<List<SimilarBookModel>> getSimilarBooks({required int id});
}
