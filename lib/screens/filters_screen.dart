import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  final Function saveFilters;
  final Map<String,bool>currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

@override
initState(){
_glutenFree=widget.currentFilters['gluten'];
_lactoseFree=widget.currentFilters['lactose'];
_vegan=widget.currentFilters['vegan'];
_vegetarian=widget.currentFilters['vegetarian'];
super.initState();
}

Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updatedValue)
{
  return SwitchListTile(
    title: Text(title),
    value: currentValue,
    subtitle: Text(description),
  onChanged: updatedValue,
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: (){
            final selectedFilters={
            'lactose':_lactoseFree,
            'gluten':_glutenFree,
            'vegan':_vegan,
            'vegetarian':_vegetarian,
          };  
              widget.saveFilters(selectedFilters);
          },
        ),
      ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your Meal here' ,
            style: Theme.of(context).textTheme.title,),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                 'Only Include Gluten-Free Meals',
                  _glutenFree, 
                  (newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Latose Free',
                 'Only Include Lactose-Free Meals',
                  _lactoseFree, 
                  (newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                 'Only Include Vegetarian Meals',
                  _vegetarian, 
                  (newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                 'Only Include Vegan Meals',
                  _vegan, 
                  (newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      )
    );
    
  }
}