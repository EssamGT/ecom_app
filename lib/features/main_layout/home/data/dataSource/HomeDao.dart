import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/home/data/models/BrandsResponse/brands_response.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/CategoriesModel/CategoriesResponse.dart';

abstract class HomeDao {
  Future<Either<CategoriesResponce, String>> getCategories();
  Future<Either<BrandsResponse, String>> getBrands();
}
