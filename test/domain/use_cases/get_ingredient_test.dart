import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pantrythief/domain/entities/ingredient.dart';
import 'package:pantrythief/domain/usecases/get_ingredient.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  GetIngredientUseCase? getIngredientUseCase;
  MockIngredientRepository? mockIngredientRepository;

  setUp(() {
    mockIngredientRepository = MockIngredientRepository();
    getIngredientUseCase = GetIngredientUseCase(mockIngredientRepository!);
  });

  const testIngredient = IngredientEntity(
    name: 'Milk',
    amount: '1',
    unit: 'gallon'
  );

  const testIngredientName = 'Milk';

  test(
    'should get ingredient by name from the repository',
    () async {
      // arrange
      when(
        mockIngredientRepository!.getIngredientByName(testIngredientName)
      ).thenAnswer((_) async => const Right(testIngredient));

      // act
      final result = await getIngredientUseCase!.execute(testIngredientName);

      // assert
      expect(result, const Right(testIngredient));
    }
  );
}