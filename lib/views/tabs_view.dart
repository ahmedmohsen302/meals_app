import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/views/home_view.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/drawer.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int currentIndex = 0;
  final List<MealsModel> favouriteMeals = [];

  void toggledFavouriteStatues(MealsModel meal) {
    final isExisting = favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favouriteMeals.remove(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Meal no longer favourite')));
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Meal added to favourites')));
      });
    }
  }

  void selectView(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentView = HomeView(isToggledFavourite: toggledFavouriteStatues);
    String currentTitle = 'Categories';
    if (currentIndex == 1) {
      currentView = MealsView(
        meals: favouriteMeals,
        isToggledFavourite: toggledFavouriteStatues,
      );
      currentTitle = ' Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      drawer: MainDrawer(),
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
