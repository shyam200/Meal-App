import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';
//import 'package:meal_app/models/meal.dart';
//import '../dummy_data.dart';
//import './models/category.dart';
class CategoryMealsScreen extends StatefulWidget {
  //storing the identifier in a contant variable to avoid any mismatch during development
 static const routeName='/category-meals';
 final List<Meal>availableMeals;
 CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categoryTitle;
List<Meal>displayedMeals;
var _loadedInitData=false;

@override
  void initState() {
      
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){  //condition to check data is loaded or not
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    displayedMeals=widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();   
    _loadedInitData=true;
    }
     super.didChangeDependencies();
  }

void _removeMeal(String mealId){
 setState(() {
   displayedMeals.removeWhere((meal)=>meal.id==mealId);
 });
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(categoryTitle),
      ), 
          body: ListView.builder(itemBuilder: (ctx, index){
            //returning the MealItem widget that is s tyle in meal_item.dart
            return MealItem(
              id: displayedMeals[index].id,
              title:displayedMeals[index].title, 
              affordability:displayedMeals[index].affordability, 
              complexity:displayedMeals[index].complexity, 
              duration:displayedMeals[index].duration,
              imageUrl:displayedMeals[index].imageUrl,
            
              );
            }, itemCount:displayedMeals.length, 
        
          ),
      
    );
  }
}