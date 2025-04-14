import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/categories/domain/repository/sub_categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubCategoriesUseCase {
  SubCategoriesRepo subCategoriesRepo;
  @factoryMethod
  SubCategoriesUseCase(this.subCategoriesRepo);
  Future<Either<SubCategoriesEntity, String>> call(String id) =>
      subCategoriesRepo.getSubCategories(id: id);
}
