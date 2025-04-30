import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals_model.dart';

class FavouritStateNotifier extends StateNotifier<List<MealsModel>> {
  FavouritStateNotifier() : super([]);

  void markFavourite(MealsModel meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritStateNotifier, List<MealsModel>>((ref) {
      return FavouritStateNotifier();
    });
