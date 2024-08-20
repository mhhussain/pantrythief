import 'package:pantrythief/core/enum/ingredient_unit.dart';
import 'package:pantrythief/domain/entities/ingredient_entity.dart';

class IngredientModel extends IngredientEntity {
  IngredientModel({
    required super.name,
    required super.amount,
    required super.units,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'amount': amount,
      'units': units.name,
    };
  }

  factory IngredientModel.fromJson(Map<String, dynamic> map) {
    return IngredientModel(
      name: map['name'],
      amount: map['amount'],
      units: IngredientUnit.fromString(map['units']),
    );
  }
}