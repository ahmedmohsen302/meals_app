import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/views/meal_details_view.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key, required this.title, required this.meals});
  final String title;
  final List<MealsModel> meals;
  void onSelect(BuildContext context, MealsModel meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealDetailsView(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:
          meals.isNotEmpty
              ? ListView.builder(
                itemCount: meals.length,
                itemBuilder:
                    (context, index) => MealItem(
                      meal: meals[index],
                      onSelectMeal: (meals) {
                        onSelect(context, meals);
                      },
                    ),
              )
              : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Oops.... there has been an error',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Try different category',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
