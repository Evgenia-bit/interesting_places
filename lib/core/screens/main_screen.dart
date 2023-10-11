import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interesting_places/core/routes/router.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final titleHandle = SliverOverlapAbsorberHandle();
  final searchFieldHandle = SliverOverlapAbsorberHandle();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.white,
      routes: const [
        PlaceListRoute(),
        PlaceListMapRoute(),
        EmptyRoute(),
        EmptyRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.lightestGrey)),
          ),
          child: NavigationBar(
            height: 56,
            indicatorColor: Colors.transparent,
            backgroundColor: AppColors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: [
              NavigationDestination(
                label: 'Full list',
                icon: SvgPicture.asset(
                  'assets/icons/list.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/list_full.svg',
                ),
              ),
              NavigationDestination(
                label: 'Map',
                icon: SvgPicture.asset(
                  'assets/icons/map.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/map_full.svg',
                ),
              ),
              NavigationDestination(
                label: 'Favourites',
                icon: SvgPicture.asset(
                  'assets/icons/favourites.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/favourites_full.svg',
                ),
              ),
              NavigationDestination(
                label: 'Settings',
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                ),
                selectedIcon: SvgPicture.asset(
                  'assets/icons/settings_full.svg',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
