import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/Internet_checker.dart';
import 'package:ecom/core/resources/strings_manger.dart';
import 'package:ecom/features/main_layout/home/data/dataSource/HomeDao.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:ecom/features/main_layout/home/domain/repository/Categories_Repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  HomeDao homeDao;
  @factoryMethod
  HomeRepoImpl(this.homeDao);
  @override
  Future<Either<CategoriesEntity, String>> getCategories() async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      var result = await homeDao.getCategories();
      return result.fold(
        (responce) {
          return Left(responce.toCategoriesEntity());
        },
        (error) {
          return Right(error);
        },
      );
    } else {
      return Right(StringsManger.noInternetConnection);
    }
  }

  @override
  Future<Either<BrandsEntity, String>> getBrands() async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      var result = await homeDao.getBrands();
    return  result.fold(
        (response) {
          return Left(response.toBrandesEntity());
        },
        (error) {
          return Right(error);
        },
      );
    } else {
      return Right(StringsManger.noInternetConnection);
    }
  }
}
