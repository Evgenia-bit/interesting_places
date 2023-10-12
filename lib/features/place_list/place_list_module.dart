import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/di/di.dart';
import 'package:interesting_places/features/get_current_position/domain/repository/get_current_position_repository.dart';
import 'package:interesting_places/features/place_list/domain/repository/place_list_repository.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:provider/single_child_widget.dart';

class PlaceListModule extends SingleChildStatelessWidget {
  const PlaceListModule({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider(
        create: (_) => PlaceListBloc(
          placeListRepository: getIt<PlaceListRepository>(),
          positionRepository: getIt<PositionRepository>(),
        )..add(GetPlaceListEvent()),
        child: child,
      );
}
