import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return const ListItem();
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key});

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/photo_2.png'),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Text(
                      'музей',
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
          ColoredBox(
            color: AppColors.lightestGrey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Воронежский областной краеведческий музей',
                    style: textTheme.displayMedium?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'краткое описание',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
