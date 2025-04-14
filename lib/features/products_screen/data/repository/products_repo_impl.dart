import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/Internet_checker.dart';
import 'package:ecom/core/resources/strings_manger.dart';
import 'package:ecom/features/products_screen/data/DataSource/Products_Dao.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';
import 'package:ecom/features/products_screen/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  ProductsDao productsDao;
  @factoryMethod
  ProductsRepoImpl(this.productsDao);
  @override
  Future<Either<ProductsEntity, String>> getCategorieProducts(
    String categorieId,
  ) async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      var resault = await productsDao.getCategorieProducts(categorieId);
      return resault.fold(
        (response) {
          return Left(response.toProductEntity());
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
