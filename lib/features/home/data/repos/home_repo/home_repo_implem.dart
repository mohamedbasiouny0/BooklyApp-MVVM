import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/network/dio_client.dart';
import 'package:test2/core/utils/end_points.dart';
import 'package:test2/features/home/data/models/general_book_model/general_book_model.dart';
import 'package:test2/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImplem implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplem(DioClient dioClient, {required this.apiService});
  @override
  Future<List<GeneralBookModel>> getFeaturedBooks() async {
    final respone = await apiService.get(endPoint: EndPoints.featuredEndPoint);

    var books = respone['books'];
    List<GeneralBookModel> modelsList = [];
    for (var element in books) {
      modelsList.add(GeneralBookModel.fromJson(element[0]));
    }
    return modelsList;
  }

  @override
  Future<List<GeneralBookModel>> getNewestBooks() async {
    final response = await apiService.get(endPoint: EndPoints.newestEndPoint);

    var books = response['books'];
    List<GeneralBookModel> modelsList = [];
    for (var element in books) {
      modelsList.add(GeneralBookModel.fromJson(element[0]));
    }
    return modelsList;
  }
}
