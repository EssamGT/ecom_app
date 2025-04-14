import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';

abstract class SubCategoriesRepo {
  Future<Either<SubCategoriesEntity, String>> getSubCategories({
    required String id,
  });
}