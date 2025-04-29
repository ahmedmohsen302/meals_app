import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelect});
  final void Function(String identifier) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(44),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withAlpha(50),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 24),
                Text(
                  'Cooking...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              onSelect('Meals');
            },
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(height: 6),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () {
              onSelect('Filters');
            },
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
