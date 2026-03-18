import 'package:test2/core/network/api_service.dart';
import 'package:test2/features/home/data/models/book_details_model/book_details_model.dart';
import 'package:test2/features/home/data/repos/book_details_repo/book_details_repo.dart';

class BookDetailsRepoImplem implements BookDetailsRepo {
  final ApiService apiService;

  BookDetailsRepoImplem({required this.apiService});

  @override
  Future<BookDetailsModel> getBookDetails({required int id}) async {
    final response = await apiService.get(endPoint: id.toString());

    return response;
  }
}
