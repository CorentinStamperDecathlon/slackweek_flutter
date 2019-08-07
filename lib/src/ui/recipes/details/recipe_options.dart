import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeOptions extends StatelessWidget {

  RecipeModel _model;

  RecipeOptions(RecipeModel model) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${_model.title}'),
      content: Text('Do you want to remove this recipe ?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Remove'),
          onPressed: () => _remove(context),
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  void _remove(BuildContext context) {
    Navigator.of(context).pop();
    // Todo: remove document from firebase
  }
}