import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Новое место',
          style: textTheme.headlineSmall,
        ),
        leadingWidth: 80,
        leading: TextButton(
          child: Text(
            'Отмена',
            style: textTheme.displayMedium,
          ),
          onPressed: () {},
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}

/* class CategoryItem extends StatelessWidget {
  final String text;

  const CategoryItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.lightestGrey),
          )
        ),
        child: Text(text),
      ),
    );
  }
}
 */