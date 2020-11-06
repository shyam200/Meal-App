import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
//import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool>_filters={
    'lactose':false,
    'gluten':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeals=DUMMY_MEALS; //when app starts _availableMeals is a pointer to DummyMeals
  List<Meal>_favoriteMeal=[];
  void _setFilters(Map<String, bool>filterData){
      setState(() {
        _filters=filterData;
        _availableMeals=DUMMY_MEALS.where((meal){
          if(_filters['gluten']&& !meal.isGlutenFree){
            return false;
          }
          if(_filters['lactose']&& !meal.isLactoseFree){
            return false;
          }
          if(_filters['vegan']&& !meal.isVegan){
            return false;
          }
          if(_filters['vegetarian']&& !meal.isVegetarian){
            return false;
          } 
            return true;   //return true to keep checking for meals
        }).toList();
      });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeal.indexWhere((meal)=>meal.id==mealId);
        if(existingIndex>=0){
         setState(() {
            _favoriteMeal.removeAt(existingIndex);
         });
        }
        else
        setState(() {
          _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
        });
  }
  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //below setting default theme for app
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 224, 229, 1),
        fontFamily: 'Raleway',  //using this text theme as global throught the app
//setting global text theme
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          //below sytle to provide globally this style i.e where it used
          title: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      //here we pass home screen that is root of the app
    //  home: CategoriesScreen(),
//routes;- it is basically a table of pages or routes this is alternate method used in big app
routes: {
//   '/category-meals':(ctx)=>CategoryMealsScreen(),
    '/':(ctx)=>TabsScreen(_favoriteMeal),  //default scrren
    CategoryMealsScreen.routeName:(ctx)=>CategoryMealsScreen(_availableMeals),
    MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toggleFavorite,_isMealFavorite),
    FiltersScreen.routeName:(ctx)=>FiltersScreen(_filters,_setFilters),
}
 );
  }
}
