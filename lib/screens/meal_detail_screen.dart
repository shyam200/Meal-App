import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName='/mea-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);
  Widget buildSectionTitle(BuildContext context,String text){ //simple method to return text on call
    return Container(
            margin: EdgeInsets.symmetric(vertical:10),
            child: Text(
              text,
              style:Theme.of(context).textTheme.title),//giving the text theme
          );
  }
  //below returning a simple container with styling on call by passing child of container
  Widget buildContainer(Widget child){
    return Container( //for ListView because it's takes its parent height else takes infinity height
            decoration:BoxDecoration(
             color: Colors.white,
             border: Border.all(color: Colors.grey),
            borderRadius:BorderRadius.circular(10),
            ) ,
            margin: EdgeInsets.all(10), //b/w ingradients title and its items
            padding: EdgeInsets.all(10),//b/w box and text
            height: 200,
            width: 300,
            child: child );
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;  //mealId has id of of every meal m1,m2.....
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id == mealId); //return a single meal if id is match
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
              child: Column(  //create columnn having three field image ingredients and steps to make it
          children: <Widget>[
            Container(  //this container is to display image
              height:300,
              width: double.infinity,
              child: Image.network(
              selectedMeal.imageUrl ,height: 200,width: double.infinity),
             // selectedMeal.ingredients,
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                 ListView.builder( //List of ingredients
                itemBuilder: (ctx,index)=>Card(
                  color: Theme.of(context).accentColor,  //card color (yellowish)
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), //b/w text and card
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx,index)=>Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index+1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                     Divider(color: Colors.black38,)
                  ],
                ),  
                itemCount:selectedMeal.steps.length,
              ),
            ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId)? Icons.star: Icons.star_border
        ),
        onPressed: ()=> toggleFavorite(mealId),
      ),
    );
  }
}