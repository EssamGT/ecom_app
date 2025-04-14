import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/Internet_checker.dart';
import 'package:ecom/core/resources/strings_manger.dart';
import 'package:ecom/features/main_layout/categories/data/DataSource/sub_categories_dao.dart';
import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/categories/domain/repository/sub_categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl extends SubCategoriesRepo {
  SubCategoriesDao subCategoriesDao;
  @factoryMethod
  SubCategoriesRepoImpl(this.subCategoriesDao);
  @override
  Future<Either<SubCategoriesEntity, String>> getSubCategories({
    required String id,
  }) async {
    bool internet = await InternetChecker.internetConnection();
    if (internet) {
      var response = await subCategoriesDao.getSubCategories(id: id);
      return response.fold(
        (response) {
          return Left(response.toSubCstegoriesEntity());
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
