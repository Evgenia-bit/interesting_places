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
    final colorScheme = Theme.of(context).colorScheme;

    return AutoTabsScaffold(
      backgroundColor: colorScheme.background,
      routes: const [
        PlaceListRoute(),
        PlaceListMapRoute(),
        EmptyRoute(),
        EmptyRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.lightGrey.withOpacity(0.1)),
            ),
          ),
          child: NavigationBar(
            height: 56,
            indicatorColor: Colors.transparent,
            backgroundColor: colorScheme.background,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: const [
              _NavigationBarItem(
                iconName: 'list',
                label: 'List',
              ),
              _NavigationBarItem(
                iconName: 'map',
                label: 'Map',
              ),
              _NavigationBarItem(
                iconName: 'favourites',
                label: 'Favourites',
              ),
              _NavigationBarItem(
                iconName: 'settings',
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final String label;
  final String iconName;

  const _NavigationBarItem({
    super.key,
    required this.label,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    final tertiary = Theme.of(context).colorScheme.tertiary;
    return NavigationDestination(
      label: label,
      icon: SvgPicture.asset(
        'assets/icons/$iconName.svg',
        colorFilter: ColorFilter.mode(
          tertiary,
          BlendMode.srcIn,
        ),
      ),
      selectedIcon: SvgPicture.asset(
        'assets/icons/${iconName}_full.svg',
        colorFilter: ColorFilter.mode(
          tertiary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
