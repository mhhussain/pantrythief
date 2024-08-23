import 'package:equatable/equatable.dart';
import 'package:pantrythief/core/enum/ingredient_unit.dart';

class IngredientEntity extends Equatable {
  final String name;
  final int amount;
  final IngredientUnit units;

  const IngredientEntity({
    required this.name,
    required this.amount,
    required this.units,
  });

  IngredientEntity operator +(IngredientEntity ingredient) {
    if (name != ingredient.name) throw 'mismatched ingredient name';
    return IngredientEntity(
      name: name,
      amount: (amount + (units == ingredient.units ? ingredient.amount : ingredient.to(units).amount)).clamp(0, double.nan).floor(),
      units: units
    );
  }

  IngredientEntity operator -(IngredientEntity ingredient) {
    if (name != ingredient.name) throw 'mismatched ingredient name';
    return IngredientEntity(
      name: name,
      amount: (amount - (units == ingredient.units ? ingredient.amount : ingredient.to(units).amount)).clamp(0, double.nan).floor(),
      units: units
    );
  }

  IngredientEntity to(IngredientUnit newUnit) {
    return IngredientEntity(
      name: name,
      amount: (amount * units.to(newUnit)).floor(),
      units: newUnit,
    );
  }

  @override
  List<Object?> get props => [
    name,
    amount,
    units,
  ];
}