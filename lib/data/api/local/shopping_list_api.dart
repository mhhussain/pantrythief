import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';

class IngredientApi {
  static const String key = 'DB.SHOPPINGLIST';

  Future<List<IngredientModel>> getIngredients() async {
    // retrieve list from shared preferences
    final instance = await SharedPreferences.getInstance();
    final ingredientsList = instance.getStringList(key) ?? [];

    // decode each string from base64 -> jsonstring
    // json decode and map with fromJson methods on models
    return [
      ...ingredientsList.map((i) => IngredientModel.fromJson(json.decode(utf8.decode(base64.decode(i)))))
    ];
  }

  Future<void> addIngredient(IngredientModel ingredient) async {
    final instance = await SharedPreferences.getInstance();
    final ingredientsList = instance.getStringList(key) ?? [];

    ingredientsList.add(base64.encode(utf8.encode(json.encode(ingredient.toJson()))));
    
    await instance.setStringList(key, ingredientsList);
  }

  Future<void> removeIngredient(IngredientModel ingredient) async {
    final instance = await SharedPreferences.getInstance();
    final ingredientsList = await getIngredients();

    await instance.setStringList(key, ingredientsList.where((i) => i.name != ingredient.name).map((i) => base64.encode(utf8.encode(json.encode(i.toJson())))).toList());
  }
}