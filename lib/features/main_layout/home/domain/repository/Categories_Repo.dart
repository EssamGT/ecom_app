import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';

abstract class HomeRepo {
  Future<Either<CategoriesEntity, String>> getCategories();
  Future<Either<BrandsEntity, String>> getBrands();
}
