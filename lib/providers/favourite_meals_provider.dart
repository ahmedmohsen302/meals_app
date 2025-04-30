import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals_model.dart';

class FavouritStateNotifier extends StateNotifier<List<MealsModel>> {
  FavouritStateNotifier() : super([]);

  bool markFavourite(MealsModel meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritStateNotifier, List<MealsModel>>((ref) {
      return FavouritStateNotifier();
    });
