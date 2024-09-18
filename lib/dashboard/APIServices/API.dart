import 'package:dio/dio.dart';
import 'package:newsapp/dashboard/General/model/model.dart';

class ApiMethods {
  Dio dio = Dio();

  Future<List<CategoryModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://api.worldnewsapi.com/search-news?api-key=ef4561f00bae4431aa7ad07bb75dcbff&categories=$category&language=en');

      Map<String, dynamic> jsonData = response.data;
      List<CategoryModel> newsList = [];
      for (var article in jsonData['news']) {
        CategoryModel articleList = CategoryModel(
          image: article['image'] ?? '',
          title: article['title'] ?? '',
          Subtitle: article['text'] ?? '',
        );
        newsList.add(articleList);
      }

      return newsList;
    } on DioException catch (e) {
      print('error in Dio: ${e.message}');
      return [];
    } catch (e) {
      print(' error happened: $e');
      return [];
    }
  }
}
