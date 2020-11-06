import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
class TabsScreen extends StatefulWidget {
final List<Meal>favoriteMeals;
TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>>_pages;
  int _selectedPageIndex=0;
@override
  void initState() {  //we use this list because we can't use widget.favoriteMeals since widget can't access favorites if list is initialized in class
        _pages=[
    {
      'page':CategoriesScreen(),
      'title':'Category'
    },
    {
       'page':FavoritesScreen(widget.favoriteMeals),
       'title':'Favorites'
    }
  ];
    super.initState();
  }

  void _selectPage(int index){
setState(() {
  _selectedPageIndex=index;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),  //calling MainDrawer class
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
         items: [
           BottomNavigationBarItem(
             icon: Icon(Icons.category),
              title:Text('Category')
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.star),
              title:Text('Favorites'), 
         ),
         ],
        ),
    );  
  }
}