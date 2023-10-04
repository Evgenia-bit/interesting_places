part of 'category_bloc.dart';

@immutable
class CategoryState {
  final List<Category> categoryList;
  const CategoryState({this.categoryList = const []});

  CategoryState copyWith({List<Category>? categoryList}) {
    return CategoryState(
      categoryList: categoryList ?? this.categoryList,
    );
  }
}
