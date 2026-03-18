import 'package:test2/features/home/data/models/home_book_model/home_book_model.dart';

abstract class HomeRepo {
  Future<HomeBookModel> getFeaturedBooks();
  Future<HomeBookModel> getNewestBooks();
}
