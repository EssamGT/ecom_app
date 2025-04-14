import 'package:dartz/dartz.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';
import 'package:ecom/features/products_screen/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsUseCase {
  ProductsRepo repo;
  @factoryMethod
  ProductsUseCase(this.repo);
  Future<Either<ProductsEntity, String>> call(String categorieId)=>repo.getCategorieProducts(categorieId);
}
