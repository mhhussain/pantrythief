import 'package:dartz/dartz.dart';
import 'package:pantrythief/core/error/failure.dart';
import 'package:pantrythief/domain/entities/ingredient.dart';

abstract class IngredientRepository {
  Future<Either<Failure, IngredientEntity>> getIngredientByName(String name);
}