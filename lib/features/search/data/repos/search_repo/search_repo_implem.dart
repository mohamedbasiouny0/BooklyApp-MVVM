import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/network/dio_client.dart';
import 'package:test2/core/utils/end_points.dart';
import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';
import 'package:test2/features/search/data/repos/search_repo/search_repo.dart';

class SearchRepoImplem implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplem(DioClient dioClient, {required this.apiService});
  @override
  Future<List<GeneralBookModel>> getBooks({required String q}) async {
    final respone = await apiService.get(
      endPoint: EndPoints.searchEndPoint(q: q),
    );

    var books = respone['books'];
    List<GeneralBookModel> modelsList = [];
    for (var element in books) {
      modelsList.add(GeneralBookModel.fromJson(element[0]));
    }
    return modelsList;
  }
}
