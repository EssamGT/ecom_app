import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/api_manger.dart';
import 'package:ecom/core/remote/endpoints.dart';
import 'package:ecom/features/main_layout/categories/data/DataSource/sub_categories_dao.dart';
import 'package:ecom/features/main_layout/categories/data/models/SubCatigoriesModel/sub_catigories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesDao)
class SubCategoriesDaoImpl extends SubCategoriesDao {
  ApiManger apiManger;
  @factoryMethod
  SubCategoriesDaoImpl(this.apiManger);
  @override
  Future<Either<SubCatigoriesModel, String>> getSubCategories({
    required String id,
  }) async {
    try {
      var resault = await apiManger.getRequest(
        path: Endpoints.subCategories(id),
      );
      return Left(SubCatigoriesModel.fromJson(resault.data));
    } catch (error) {
      return Right(error.toString());
    }
  }
}
