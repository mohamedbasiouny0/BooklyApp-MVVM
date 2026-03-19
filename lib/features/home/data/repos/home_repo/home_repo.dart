import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';

abstract class HomeRepo {
  Future<List<GeneralBookModel>> getFeaturedBooks();
  Future<List<GeneralBookModel>> getNewestBooks();
}
