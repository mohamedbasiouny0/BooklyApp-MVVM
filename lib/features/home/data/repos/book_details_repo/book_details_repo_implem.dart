import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/utils/end_points.dart';
import 'package:test2/features/home/data/models/book_details_model/book_details_model.dart';
import 'package:test2/features/home/data/models/similar_book_model/similar_book_model.dart';
import 'package:test2/features/home/data/repos/book_details_repo/book_details_repo.dart';

class BookDetailsRepoImplem implements BookDetailsRepo {
  final ApiService apiService;

  BookDetailsRepoImplem({required this.apiService});

  @override
  Future<BookDetailsModel> getBookDetails({required int id}) async {
    final response = await apiService.get(
      endPoint: EndPoints.getBookInfoEndPoint(id: id),
    );

    return BookDetailsModel.fromJson(response);
  }

  @override
  Future<List<SimilarBookModel>> getSimilarBooks({required int id}) async {
    final response = await apiService.get(
      endPoint: EndPoints.similarEndPoint(id: id),
    );

    var data = response['similar_books'];
    List<SimilarBookModel> list = [];
    for (var element in data) {
      list.add(SimilarBookModel.fromJson(element));
    }
    return list;
  }
}
