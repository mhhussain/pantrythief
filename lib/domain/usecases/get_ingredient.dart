import 'package:dartz/dartz.dart';
import 'package:pantrythief/core/error/failure.dart';
import 'package:pantrythief/domain/entities/ingredient.dart';
import 'package:pantrythief/domain/repositories/ingredient_repository.dart';

class GetIngredientUseCase {
  final IngredientRepository ingredientRepository;

  GetIngredientUseCase(this.ingredientRepository);

  Future<Either<Failure, IngredientEntity>> execute (String name) {
    return ingredientRepository.getIngredientByName(name);
  }
}