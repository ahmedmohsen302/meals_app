import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/melas_provider.dart';

enum Filter { glutenFree, lactoseFree, vegan, vageterian }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vageterian: false,
        Filter.vegan: false,
      });
  void setsFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
      return FiltersNotifier();
    });

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilter = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilter[Filter.glutenFree]! && meal.isGlutenFree) {
      return false;
    }
    if (selectedFilter[Filter.lactoseFree]! && meal.isLactoseFree) {
      return false;
    }
    if (selectedFilter[Filter.vageterian]! && meal.isVegetarian) {
      return false;
    }
    if (selectedFilter[Filter.vegan]! && meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
