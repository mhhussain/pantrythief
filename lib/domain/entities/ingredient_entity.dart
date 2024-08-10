import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  final String name;
  final int amount;
  final String units;

  const IngredientEntity({
    required this.name,
    required this.amount,
    required this.units,
  });

  @override
  List<Object?> get props => [
    name,
    amount,
    units,
  ];
}