import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/flters_provider.dart';
import 'package:meals_app/views/tabs_view.dart';
import 'package:meals_app/widgets/drawer.dart';

class FiltersView extends ConsumerStatefulWidget {
  const FiltersView({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends ConsumerState<FiltersView> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVageterian = false;
  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    isVageterian = widget.currentFilters[Filter.vageterian]!;
    isVegan = widget.currentFilters[Filter.vegan]!;
  }

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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vageterian: isVageterian,
            Filter.vegan: isVegan,
          });
        },
        child: Column(
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
            SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop({
                  Filter.glutenFree: isGlutenFree,
                  Filter.lactoseFree: isLactoseFree,
                  Filter.vageterian: isVageterian,
                  Filter.vegan: isVegan,
                });
              },
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
