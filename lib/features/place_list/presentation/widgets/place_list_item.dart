import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/domain/entity/place_entity.dart';

class PlaceListItem extends StatelessWidget {
  final PlaceEntity place;
  final bool withDescription;
  const PlaceListItem({
    super.key,
    required this.place,
    required this.withDescription,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  Column(
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
                    style: theme.textTheme.displaySmall
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
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  if (withDescription) ...[
                    const SizedBox(height: 2),
                    Text(
                      place.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
