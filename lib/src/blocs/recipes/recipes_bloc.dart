import 'package:cooking_recipes/src/models/recipes/recipe_model.dart';
import 'package:cooking_recipes/src/resources/recipes/recipes_repository.dart';
import 'package:rxdart/rxdart.dart';

class RecipesBloc {
  final _repository = RecipesRepository();
  final _fetcher = PublishSubject<List<RecipeModel>>();

  Observable<List<RecipeModel>> get recipes => _fetcher.stream;

  fetchRecipes() async {
    List<RecipeModel> models = await _repository.fetchRecipes();
    _fetcher.sink.add(models);
  }

  dispose() {
    _fetcher.close();
  }
}

final bloc = RecipesBloc();