import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/api_manger.dart';
import 'package:ecom/core/remote/endpoints.dart';
import 'package:ecom/features/main_layout/home/data/dataSource/HomeDao.dart';
import 'package:ecom/features/main_layout/home/data/models/BrandsResponse/brands_response.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/CategoriesModel/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDao)
class HomeDaoImpi extends HomeDao {
  ApiManger apiManger;
  @factoryMethod
  HomeDaoImpi(this.apiManger);
  @override
  Future<Either<CategoriesResponce, String>> getCategories() async {
    try {
      var result = await apiManger.getRequest(path: Endpoints.Categories);
      return Left(await CategoriesResponce.fromJson(result.data));
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<BrandsResponse, String>> getBrands() async {
    try {
      var resault = await apiManger.getRequest(path: Endpoints.allBrands);
      return Left(BrandsResponse.fromJson(resault.data));
    } catch (error) {
      return Right(error.toString());
    }
  }
}
