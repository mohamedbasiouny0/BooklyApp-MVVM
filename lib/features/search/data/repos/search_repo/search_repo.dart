import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';

abstract class SearchRepo {
  Future<List<GeneralBookModel>> getBooks({required String q});
}
