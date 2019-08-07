import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:cooking_recipes/src/ui/recipes/details/recipe_options.dart';
import 'package:cooking_recipes/src/ui/recipes/details/step_item.dart';
import 'package:flutter/material.dart';

import 'ingredient_item.dart';

class RecipeDetails extends StatelessWidget {

  static const routeName = "/details";
  
  @override
  Widget build(BuildContext context) {
    RecipeModel model = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${model.title}'),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              child: Icon(Icons.delete),
              margin: EdgeInsets.all(16.0),
            ),
            onTap: () => _remove(context, model),
          ),
        ],
      ),
      body: _buildList(model),
    );
  }

  Future<void> _remove(BuildContext context, RecipeModel model) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => RecipeOptions(model)
    );
  }

  Widget _buildList(RecipeModel model) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0)
          return _buildImage(model.imageUrl);
        if (index == 1)
          return _buildTitle("Ingredients");
        if (index > 1 && index < model.ingredients.length + 2)
          return IngredientItem(model.ingredients[index-2]);
        if (index == model.ingredients.length + 2)
          return _buildTitle("Steps");
        if (index > model.ingredients.length + 2 && index < model.ingredients.length + model.steps.length + 3)
          return StepItem(model.steps[index - (model.ingredients.length + 3)]);
        return Container();
      },
      itemCount: _entryCount(model)
    );
  }

  int _entryCount(RecipeModel model) {
    var count = 1; // 1 for the bottom image
    if (model.ingredients.isNotEmpty)
      count += 1 + model.ingredients.length;

    if (model.steps.isNotEmpty)
      count += 1 + model.steps.length;

    return count;
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    return Container(
      child: Image.network(url),
    );
  }
}