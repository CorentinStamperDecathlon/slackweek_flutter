import 'package:cooking_recipes/src/ui/recipes/create/recipe_creation.dart';
import 'package:cooking_recipes/src/ui/recipes/details/recipe_details.dart';
import 'package:cooking_recipes/src/ui/recipes/list/recipes_list.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => RecipesList(),
        RecipesList.routeName: (context) => RecipesList(),
        RecipeDetails.routeName: (context) => RecipeDetails(),
        RecipeCreation.routeName: (context) => RecipeCreation(),
      },
    );
  }
}