import 'package:flutter/material.dart';
import 'package:meals_app/views/tabs_view.dart';
import 'package:meals_app/widgets/drawer.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key});

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVageterian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(
        onSelect: (identifier) {
          if (identifier == 'Filters') {
            Navigator.pop(context);
          } else if (identifier == 'Meals') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TabsView()),
            );
          }
        },
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (value) {
              setState(() {
                isGlutenFree = value;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'only gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SwitchListTile(
            value: isLactoseFree,
            onChanged: (value) {
              setState(() {
                isLactoseFree = value;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'only Lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SwitchListTile(
            value: isVageterian,
            onChanged: (value) {
              setState(() {
                isVageterian = value;
              });
            },
            title: Text(
              'Vageterian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'only Vageterian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SwitchListTile(
            value: isVegan,
            onChanged: (value) {
              setState(() {
                isVegan = value;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              'only Vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
