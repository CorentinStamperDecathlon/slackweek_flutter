import 'package:cooking_recipes/src/models/recipes/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {

  IngredientModel _model;

  IngredientItem(IngredientModel model) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: _buildItem(),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
      child: Text("${_model.label}: ${_model.quantity}${_model.unit}"),
    );
  }
}