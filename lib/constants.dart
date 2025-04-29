import 'package:flutter/material.dart';
import 'package:meals_app/views/filters_view.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF37064A),
  brightness: Brightness.dark,
);
const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vageterian: false,
  Filter.vegan: false,
};
