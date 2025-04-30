import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/data/dummy_meal_data.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:meals_app/views/filters_view.dart';
import 'package:meals_app/views/home_view.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabsView extends ConsumerStatefulWidget {
  const TabsView({super.key});

  @override
  ConsumerState<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends ConsumerState<TabsView> {
  int currentIndex = 0;
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void selectView(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onSelect(String idintefier) async {
    if (idintefier == 'Filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersView(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    } else if (idintefier == 'Meals') {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals =
        dummyMeals.where((meal) {
          if (selectedFilters[Filter.glutenFree]! && meal.isGlutenFree) {
            return false;
          }
          if (selectedFilters[Filter.lactoseFree]! && meal.isLactoseFree) {
            return false;
          }
          if (selectedFilters[Filter.vageterian]! && meal.isVegetarian) {
            return false;
          }
          if (selectedFilters[Filter.vegan]! && meal.isVegan) {
            return false;
          }
          return true;
        }).toList();
    Widget currentView = HomeView(availableMeals: availableMeals);
    String currentTitle = 'Categories';
    if (currentIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      currentView = MealsView(meals: favouriteMeals);
      currentTitle = ' Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      drawer: MainDrawer(onSelect: onSelect),
      body: currentView,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectView,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
