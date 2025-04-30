import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/category_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.availableMeals});
  final List<MealsModel> availableMeals;
  void selectCategory(BuildContext context, CategoryModel category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => MealsView(
              title: category.title,
              meals:
                  availableMeals
                      .where((meal) => meal.categories.contains(category.id))
                      .toList(),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (var category in availableCategories)
          CategoryItem(
            category: category,
            onSelectItem: () {
              selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
