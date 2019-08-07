import 'dart:async';

import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:cooking_recipes/src/resources/recipes/recipes_provider.dart';

class RecipesRepository {
  final _provider = RecipesProvider();

  Future<List<RecipeModel>> fetchRecipes() => _provider.fetchRecipes();
}