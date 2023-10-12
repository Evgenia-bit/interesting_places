import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interesting_places/core/widgets/new_place_button.dart';
import 'package:interesting_places/features/place_list/presentation/bloc/place_list_bloc.dart';
import 'package:interesting_places/features/place_list/presentation/widgets/place_list.dart';
import 'package:interesting_places/core/widgets/search_field.dart';

@RoutePage()
class PlaceListScreen extends StatefulWidget {
  const PlaceListScreen({super.key});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  final SliverOverlapAbsorberHandle titleHandle = SliverOverlapAbsorberHandle();
  final SliverOverlapAbsorberHandle searchFieldHandle =
      SliverOverlapAbsorberHandle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool _) {
          return [
            SliverOverlapAbsorber(
              handle: titleHandle,
              sliver: SliverAppBar(
                expandedHeight: 128.0,
                toolbarHeight: 56,
                pinned: true,
                backgroundColor: theme.colorScheme.background,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 32 / 18,
                  titlePadding: const EdgeInsets.all(16),
                  title: Text(
                    'Список интересных мест',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ),
            SliverOverlapAbsorber(
              handle: searchFieldHandle,
              sliver: SliverAppBar(
                pinned: true,
                primary: false,
                titleSpacing: 0.0,
                toolbarHeight: 68,
                backgroundColor: theme.colorScheme.background,
                title: const SearchField(),
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
            SliverOverlapInjector(handle: titleHandle),
            SliverOverlapInjector(handle: searchFieldHandle),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const NewPlaceButton(),
    );
  }
}
