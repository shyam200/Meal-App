import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //scaffold is responsible for the main screen that is root 
      //appBar: AppBar(
       // title: Text('DEL MEAL'),
      //),
      body: GridView(
        padding: EdgeInsets.all(25),
   //below code takes all dumy data from DUMMY_CATEGORIES one by one(i.e from index 0,1,2...) and map it into the CategoryItem     
      children:DUMMY_CATEGORIES.map((catData)=>CategoryItem(
        catData.id,catData.title, catData.color)
      ).toList(),
    
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
  ),
 ); 
 }
}