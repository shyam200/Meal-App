import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler)
  {
    return ListTile(
       leading: Icon(
         icon,
         size: 26,
       ),
       title: Text( 
         title, 
         style:TextStyle(
           fontWeight: FontWeight.bold,
           fontFamily: 'RobotoCondensed',
           fontSize: 24,
         )
       ),
       onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!', style:TextStyle(
              fontWeight: FontWeight.w900, //this provide Raleway font with the weight 900
              fontSize: 30,color: Theme.of(context).primaryColor,
             ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile(
            'Meals', 
            Icons.restaurant,
          (){ Navigator.of(context).pushReplacementNamed('/');  //this will take us to tabsScreen
               } 
            ),
          buildListTile(
            'Filter', 
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
            ),
        ],
      ),
    );
  }
}