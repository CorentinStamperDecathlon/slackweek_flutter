import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';

class RecipesProvider {
  Firestore _firestore = Firestore.instance;

  Future<List<RecipeModel>> fetchRecipes() async {
    final snapshots = _firestore.collection("recipes").snapshots();
    final recipes = await _map(snapshots);
    return recipes;
  }

  Future<List<RecipeModel>> _map(Stream<QuerySnapshot> snapshots) async {
    List<RecipeModel> models = [];
    await for (var snapshot in snapshots) {
      for (var document in snapshot.documents) {
        models.add(RecipeModel.fromJson(document.data));
      }
      return models;
    }
    return models;
  }
}