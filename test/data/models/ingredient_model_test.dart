import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pantrythief/data/models/ingredient_model.dart';
import 'package:pantrythief/domain/entities/ingredient.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testIngredientModel = IngredientModel(
    name: 'Milk',
    amount: '1',
    unit: 'gallon'
  );

  test(
    'should be a subclass of ingredient entity',
    () async {
      // assert
      expect(testIngredientModel, isA<IngredientEntity>());
    }
  );

  test(
    'should return a valid model from json',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_ingredient_response.json')
      );
      
      // act
      final result = IngredientModel.fromJson(jsonMap);

      // assert
      expect(result, equals(testIngredientModel));
    }
  );

  test(
    'should return json map containing proper data',
    () async {
      // act
      final result = testIngredientModel.toJson();

      // arrange
      final expectedJsonMap = {
        'name': 'Milk',
        'amount': '1',
        'unit': 'gallon',
      };
      expect(result, equals(expectedJsonMap));
    }
  );
}