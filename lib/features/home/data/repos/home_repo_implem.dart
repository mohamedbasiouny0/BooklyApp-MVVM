import 'package:test2/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:test2/features/home/data/repos/home_repo.dart';

class HomeRepoImplem implements HomeRepo {
  @override
  Future<HomeBookModel> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<HomeBookModel> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }
}
