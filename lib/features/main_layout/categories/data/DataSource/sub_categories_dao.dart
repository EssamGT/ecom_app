import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/categories/data/models/SubCatigoriesModel/sub_catigories_model.dart';

abstract class SubCategoriesDao {
  Future<Either<SubCatigoriesModel, String>> getSubCategories({required String id});
}
