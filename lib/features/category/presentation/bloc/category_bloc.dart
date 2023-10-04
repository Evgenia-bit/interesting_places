import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/features/category/data/models/category.dart';
import 'package:interesting_places/features/category/domain/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

const _initialState = CategoryState();

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required CategoryRepository repository})
      : _repository = repository,
        super(_initialState) {
    on<GetCategoryListEvent>(_handleGetCategoryList);
  }

  final CategoryRepository _repository;

  void _handleGetCategoryList(
    GetCategoryListEvent _,
    Emitter<CategoryState> emit,
  ) {
    final categoryList = _repository.getCategoryList();
    emit(CategoryState(categoryList: categoryList));
  }
}
