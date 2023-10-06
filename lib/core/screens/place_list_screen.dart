import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/search_field.dart';

@RoutePage()
class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 128.0,
              toolbarHeight: 56,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                expandedTitleScale: 32 / 18,
                titlePadding: const EdgeInsets.all(16),
                title: Text(
                  'Список интересных мест',
                  style: textTheme.headlineSmall,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SearchField(),
            )
          ];
        },
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
            ),
            const SliverPadding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 88,
              ),
              sliver: PlaceList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 56,
        indicatorColor: Colors.transparent,
        backgroundColor: AppColors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            label: 'Full list',
            icon: SvgPicture.asset(
              'assets/icons/list_full.svg',
            ),
          ),
          NavigationDestination(
            label: 'Map',
            icon: SvgPicture.asset(
              'assets/icons/map.svg',
            ),
          ),
          NavigationDestination(
            label: 'Favourites',
            icon: SvgPicture.asset(
              'assets/icons/favourites.svg',
            ),
          ),
          NavigationDestination(
            label: 'Settings',
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
            ),
          ),
        ],
      ),
      floatingActionButton: const Align(
        alignment: Alignment.bottomCenter,
        child: _NewPlaceButton(),
      ),
    );
  }
}

class _NewPlaceButton extends StatelessWidget {
  const _NewPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            AppColors.yellow,
            AppColors.green,
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          context.router.push(const NewPlaceRoute());
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              size: 24,
              color: AppColors.white,
            ),
            const SizedBox(width: 8),
            Text(
              'новое место'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
