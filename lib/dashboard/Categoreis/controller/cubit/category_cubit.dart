import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/dashboard/General/model/model.dart';

part 'category_state.dart';

class DashboardCubit extends Cubit<CategoryState> {
  DashboardCubit() : super(CategoryInitial());

  Dio dio = Dio();
      List<CategoryModel> newsList = [];

  
  Future<void> getNews({required String category}) async {
    emit(GetNewsLoading());

    try {
    
      Response response = await dio.get(
          'https://api.worldnewsapi.com/search-news?api-key=ef4561f00bae4431aa7ad07bb75dcbff&categories=$category&language=en');

      Map<String, dynamic> jsonData = response.data;

      for (var article in jsonData['news']) {
        CategoryModel articleList = CategoryModel(
          image: article['image'] ?? '',
          title: article['title'] ?? '',
          Subtitle: article['text'] ?? '',
        );
        newsList.add(articleList);
      }

      emit(GetNewsSuccess(data: newsList));
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.badResponse:
          emit(GetNewsError(errorMessage: 'Bad response from the server.'));
          break;

        case DioExceptionType.unknown:
          emit(GetNewsError(errorMessage: 'Unknown error occurred.'));
          break;

        case DioExceptionType.receiveTimeout:
          emit(GetNewsError(errorMessage: 'Receive timeout.'));
          break;

        case DioExceptionType.badCertificate:
          emit(GetNewsError(errorMessage: 'Bad SSL certificate.'));
          break;

        case DioExceptionType.sendTimeout:
          emit(GetNewsError(errorMessage: 'Send timeout.'));
          break;

        case DioExceptionType.connectionTimeout:
          emit(GetNewsError(errorMessage: 'Connection timeout.'));
          break;

        case DioExceptionType.cancel:
          emit(GetNewsError(errorMessage: 'Request was cancelled.'));
          break;

        case DioExceptionType.connectionError:
          emit(GetNewsError(errorMessage: 'Connection error.'));
          break;

        default:
          emit(GetNewsError(errorMessage: 'An unexpected error occurred.'));
          break;
      }
    } catch (e) {
      emit(GetNewsError(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    dio.close();
    return super.close();
  }
}
