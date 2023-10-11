import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/search_field.dart';

@RoutePage()
class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  final SliverOverlapAbsorberHandle title = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle searchField = SliverOverlapAbsorberHandle();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool _) {
          return [
            SliverOverlapAbsorber(
              handle: title,
              sliver: SliverAppBar(
                expandedHeight: 128.0,
                toolbarHeight: 56,
                pinned: true,
                backgroundColor: AppColors.white,
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
            ),
            SliverOverlapAbsorber(
              handle: searchField,
              sliver: const SliverAppBar(
                pinned: true,
                primary: false,
                titleSpacing: 0.0,
                toolbarHeight: 68,
                backgroundColor: AppColors.white,
                title: SearchField(),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                final completer = Completer();
                context
                    .read<PlaceListBloc>()
                    .add(GetPlaceListEvent(completer: completer));

                return completer.future;
              },
              builder: (
                context,
                refreshState,
                pulledExtent,
                refreshTriggerPullDistance,
                refreshIndicatorExtent,
              ) {
                return Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: CupertinoSliverRefreshControl.buildRefreshIndicator(
                    context,
                    refreshState,
                    pulledExtent,
                    refreshTriggerPullDistance,
                    refreshIndicatorExtent,
                  ),
                );
              },
            ),
            SliverOverlapInjector(handle: title),
            SliverOverlapInjector(handle: searchField),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.lightestGrey)),
        ),
        child: NavigationBar(
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
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: const _NewPlaceButton(),
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
