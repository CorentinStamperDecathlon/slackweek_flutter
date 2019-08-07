import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {

  RecipeModel _model;

  RecipeItem(RecipeModel model) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_model.title),
      margin: EdgeInsets.all(16.0),
    );
  }
}