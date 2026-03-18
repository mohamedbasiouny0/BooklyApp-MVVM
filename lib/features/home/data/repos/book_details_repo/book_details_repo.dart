import 'package:test2/features/home/data/models/book_details_model/book_details_model.dart';

abstract class BookDetailsRepo {
  Future<BookDetailsModel> getBookDetails({required int id});
}
