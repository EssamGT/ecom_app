import 'package:dartz/dartz.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';

abstract class ProductsRepo {
  Future<Either<ProductsEntity, String>> getCategorieProducts(
    String categorieId,
  );
}
