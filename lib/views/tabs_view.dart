import 'package:flutter/material.dart';
import 'package:meals_app/views/home_view.dart';
import 'package:meals_app/views/meals_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int currentIndex = 0;

  void selectView(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentView = HomeView();
    String currentTitle = 'Categories';
    if (currentIndex == 1) {
      currentView = MealsView(meals: []);
      currentTitle = ' Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
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
