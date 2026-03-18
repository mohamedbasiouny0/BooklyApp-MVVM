import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/utils/end_points.dart';
import 'package:test2/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:test2/features/home/data/repos/home_repo.dart';

class HomeRepoImplem implements HomeRepo {
  @override
  final ApiService apiService;

  HomeRepoImplem({required this.apiService});
  @override
  Future<List<HomeBookModel>> getFeaturedBooks() async {
    final respone = await apiService.get(endPoint: EndPoints.featuredEndPoint);

    var books = respone['books'];
    List<HomeBookModel> modelsList = [];
    for (var element in books) {
      modelsList.add(HomeBookModel.fromJson(element[0]));
    }
    return modelsList;
  }

  @override
  Future<List<HomeBookModel>> getNewestBooks() async {
    final response = await apiService.get(endPoint: EndPoints.newestEndPoint);

    var books = response['books'];
    List<HomeBookModel> modelsList = [];
    for (var element in books) {
      modelsList.add(HomeBookModel.fromJson(element[0]));
    }
    return modelsList;
  }
}
