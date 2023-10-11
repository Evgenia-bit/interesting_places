import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list_item.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PlaceListBloc>().state;
    final placeList = state.filteredPlaces;

    if (state.status == LoadPlaceListStatus.processing) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.status == LoadPlaceListStatus.failed) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('Произошла ошибка при загрузке данных'),
        ),
      );
    }

    if (placeList.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Text('Список мест пуст'),
        ),
      );
    }

    return SliverList.separated(
      itemCount: placeList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return _ListItem(
          place: placeList[index],
        );
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  final PlaceEntity place;
  const _ListItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => context.router.push(PlaceDetailsRoute(place: place)),
        child: PlaceListItem(
          place: place,
          withDescription: true,
        ),
      ),
    );
  }
}
