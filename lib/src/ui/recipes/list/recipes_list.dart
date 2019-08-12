import 'package:cooking_recipes/src/ui/recipes/create/recipe_creation.dart';
import 'package:cooking_recipes/src/ui/recipes/details/recipe_details.dart';
import 'package:cooking_recipes/src/ui/recipes/list/recipe_item.dart';
import 'package:flutter/material.dart';
import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:cooking_recipes/src/blocs/recipes/recipes_bloc.dart';

class RecipesList extends StatelessWidget {

  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    bloc.fetchRecipes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: StreamBuilder(
        stream: bloc.recipes,
        builder: (context, AsyncSnapshot<List<RecipeModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () => _onAddPressed(context),
          child: Icon(Icons.add));
      })
    );
  }

  Widget buildList(AsyncSnapshot<List<RecipeModel>> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey,),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: RecipeItem(snapshot.data[index]),
            onTap: () => _onRecipeTapped(context, snapshot.data[index]),
          );
        }),
    );
  }

  void _onRecipeTapped(BuildContext context, RecipeModel model) {
    Navigator.pushNamed(
        context,
        RecipeDetails.routeName,
        arguments: model
    );
  }

  void _onAddPressed(BuildContext context) {
    Navigator.pushNamed(
      context,
      RecipeCreation.routeName
    );
  }
}