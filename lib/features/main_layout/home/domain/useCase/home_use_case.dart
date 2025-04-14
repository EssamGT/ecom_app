import 'package:dartz/dartz.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:ecom/features/main_layout/home/domain/repository/Categories_Repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  HomeRepo homeRepo;
  @factoryMethod
  HomeUseCase(this.homeRepo);
  Future<Either<CategoriesEntity, String>> call() => homeRepo.getCategories();

  Future<Either<BrandsEntity, String>> callBrands() => homeRepo.getBrands();
}
