//In this file we decorating and maintaining the meal item
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';
class MealItem extends StatelessWidget {
final String id;
final String title;
final String imageUrl;
final int duration;
final Complexity complexity;
final Affordability affordability;
//
MealItem({
  @required this.id,
  @required this.title,
  @required this.affordability,
  @required this.complexity,
  @required this.duration,
  @required this.imageUrl,
  //@required this.removeItem
});
String get complexityText{  //this is a getter to return text corresponding to enum int value(i.e index 0,1,2)
  switch(complexity){
  case Complexity.Simple:
  return 'Simple';
  break;
  case Complexity.Challenging:
  return 'Challenge';
  break;
  case Complexity.Hard:
  return 'Hard';
  break;
  default :
  return 'Unknown';
 }
}
String get affordabilityText{
  switch(affordability){
  case Affordability.Affordable:
  return 'Affordable';
  break;
  case Affordability.Pricey:
  return 'Pricey';
  break;
  case Affordability.Luxurious:
  return 'Luxurious';
  break;
  default :
  return 'Unknown';
 }
}
  void selectMeal(BuildContext context){
 Navigator.of(context).pushNamed(
  MealDetailScreen.routeName,
  arguments: id,
  )
  .then((result){  //it will run when a page is poping not when page is pushing
   if(result!=null){
    // removeItem(result);
   }
  });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(context),
      child:Card(
      shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius:BorderRadius.only(
                topLeft:Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250, 
                width: double.infinity,
                fit:BoxFit.cover,  //this is used to squeeze the image into the card
              ),
            ), 
            Positioned(
              bottom:20,
              right: 10,
              child: Container( //to provide width and color to text
                width: 300,
                padding: EdgeInsets.symmetric(  //to provide padding  along text
                vertical:5,
                horizontal: 20,
                ),
                color: Colors.black54,
                child: Text(title,
                style:TextStyle(
                fontSize:26,
                color:Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.fade, 
                ),
              ),
            ),
          ],
        ),
        Padding( //this is used with to provide a row below the stack
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //this is a outer row with three item next to each other
            children: <Widget>[
              Row(
                //this is a inner row with two item duration icon and its min
                children: <Widget>[
                Icon(Icons.schedule),
                SizedBox(width: 6),  //this is used to provide space b/w icon duration
                Text('$duration min'),
                ],
              ),
              Row(
                //this is a inner row with two item work icon and its text
                children: <Widget>[
                Icon(Icons.work),
                SizedBox(width: 6),  //this is used to provide space b/w icon duration
                Text(complexityText),
                ],
              ),
              Row(
                //this is a inner row with two item money icon and its text
                children: <Widget>[
                Icon(Icons.attach_money),
                SizedBox(width: 6),  //this is used to provide space b/w icon duration
                Text(affordabilityText),
                ],
              )
            ],
          ),
        )
      ],)
      ),
    );
  }
}