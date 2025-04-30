import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/category_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.availableMeals});
  final List<MealsModel> availableMeals;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  void selectCategory(BuildContext context, CategoryModel category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => MealsView(
              title: category.title,
              meals:
                  widget.availableMeals
                      .where((meal) => meal.categories.contains(category.id))
                      .toList(),
            ),
      ),
    );
  }

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
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
      ),
      builder:
          (context, child) => SlideTransition(
            position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Curves.bounceInOut,
              ),
            ),
            child: child,
          ),
    );
  }
}
