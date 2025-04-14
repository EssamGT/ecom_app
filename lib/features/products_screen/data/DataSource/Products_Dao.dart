import 'package:dartz/dartz.dart';
import 'package:ecom/features/products_screen/data/model/ProductsModel/products_model.dart';

abstract class ProductsDao {
  Future<Either<ProductsModelResponse, String>> getAllProducts();
  Future<Either<ProductsModelResponse, String>> getCategorieProducts(String categorieId);
}
