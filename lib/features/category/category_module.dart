import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/di/di.dart';
import 'package:interesting_places/features/category/domain/repository/category_repository.dart';
import 'package:interesting_places/features/category/presentation/bloc/category_bloc.dart';
import 'package:provider/single_child_widget.dart';

class CategoryModule extends SingleChildStatelessWidget {
  const CategoryModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) => CategoryBloc(
          repository: getIt<CategoryRepository>(),
        )..add(GetCategoryListEvent()),
        child: child,
      );
}
