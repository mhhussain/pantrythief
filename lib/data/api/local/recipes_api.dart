import 'dart:convert';
import 'package:pantrythief/data/models/recipe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeApi {
  static const String key = 'DB.RECIPES';

  Future<List<RecipeModel>> getRecipes() async {
    // retrieve list from shared preferences
    final instance = await SharedPreferences.getInstance();
    final recipesList = instance.getStringList(key) ?? [];

    // decode each string from base64 -> jsonstring
    // json decode and map with fromJson methods on models
    return [
      ...recipesList.map((r) => RecipeModel.fromJson(json.decode(utf8.decode(base64.decode(r)))))
    ];
  }

  Future<RecipeModel> getRecipeByName(String name) async {
    final recipesList = await getRecipes();
    return recipesList.where((r) => r.name == name).single;
  }

  Future<void> addRecipe(RecipeModel recipe) async {
    final instance = await SharedPreferences.getInstance();
    final recipesList = instance.getStringList(key) ?? [];
    
    recipesList.add(base64.encode(utf8.encode(json.encode(recipe.toJson()))));
    
    await instance.setStringList(key, recipesList);
  }

  Future<void> removeRecipe(RecipeModel recipe) async {
    final instance = await SharedPreferences.getInstance();
    final recipesList = await getRecipes();

    await instance.setStringList(key, recipesList.where((r) => r.name != recipe.name).map((r) => base64.encode(utf8.encode(json.encode(r.toJson())))).toList());
  }

  Future<void> updateRecipe(RecipeModel recipe) async {
    await removeRecipe(recipe);
    await addRecipe(recipe);
  }
}