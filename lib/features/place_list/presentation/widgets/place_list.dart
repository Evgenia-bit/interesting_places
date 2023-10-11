import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
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
        return ListItem(
          place: placeList[index],
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final PlaceEntity place;
  const ListItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          SizedBox(
            height: 96,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(place.imageList.first),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      place.category.name,
                      style: textTheme.displaySmall
                          ?.copyWith(color: AppColors.white),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/empty_heart.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ColoredBox(
              color: AppColors.lightestGrey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.displayMedium?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      place.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
