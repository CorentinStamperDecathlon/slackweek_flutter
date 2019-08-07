import 'package:cooking_recipes/src/models/recipes/ingredient_model.dart';
import 'package:cooking_recipes/src/models/recipes/step_model.dart';

class RecipeModel {
  String _title;
  List<IngredientModel> _ingredients = [];
  List<StepModel> _steps = [];
  String _imageUrl;

  RecipeModel.fromJson(Map<String, dynamic> json) {
    _title = json['title'];

    List<IngredientModel> ingredients = [];
    if (json['ingredients'] != null) {
      for (int i = 0; i < json['ingredients'].length; i++) {
        IngredientModel ingredient = IngredientModel.fromJson(
            Map.from(json['ingredients'][i]));
        ingredients.add(ingredient);
      }
    }
    _ingredients = ingredients;

    List<StepModel> steps = [];
    if (json['steps'] != null) {
      for (int i = 0; i < json['steps'].length; i++) {
        StepModel step = StepModel.fromJson(Map.from(json['steps'][i]));
        steps.add(step);
      }
    }
    _steps = steps;

    _imageUrl = json['imageUrl'];
  }

  String get title => _title;
  List<IngredientModel> get ingredients => _ingredients;
  List<StepModel> get steps => _steps;
  String get imageUrl => _imageUrl;
}