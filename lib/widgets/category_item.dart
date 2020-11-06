import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
//import 'package:meal_app/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id,this.title,this.color);
  void selectCategory( BuildContext ctx){
    Navigator.of(ctx).pushNamed(    
      //pushedNamed is used to pass identifier and argument
     // '/category-meals'
     CategoryMealsScreen.routeName,arguments: {
        'id':id,
        'title':title
      }     
    //   MaterialPageRoute(
    //   builder: (_){
    //     return CategoryMealsScreen(id,title);
    //   },
    // ),
  );
  }
  @override
  Widget build(BuildContext context) {
 //inkWell is just like gesturedetector which has tap method to tap on the screen to execute function but it has also repple effect    
      return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor:Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
    //receiving data from categories_screen and retrurning this decorated container
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title), 
        decoration: BoxDecoration(    
          gradient: LinearGradient(colors:[  //passing list of color to the colors to making gradient
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ) ,
          borderRadius: BorderRadius.circular(15),
          )
        ),
    );
  }
}