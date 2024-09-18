part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetNewsLoading extends CategoryState {}

class GetNewsSuccess extends CategoryState {
  final List<CategoryModel> data;   
  GetNewsSuccess({required this.data});
}
class GetNewsError extends CategoryState {
  final String errorMessage;

  GetNewsError({required this.errorMessage});
}
