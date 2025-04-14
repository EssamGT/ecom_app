part of 'catigories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CatigoriesInitial extends CategoriesState {}

class CategoriesLoaddingState extends CategoriesState {}

class CategoriesNewState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  CategoriesEntity categoriesEntity;
  CategoriesSuccessState(this.categoriesEntity);
}

class CategoriesErrorState extends CategoriesState {
  String error;
  CategoriesErrorState(this.error);
}

class SubCategoriesLoaddingState extends CategoriesState {}

class SubCategoriesSuccessState extends CategoriesState {
  SubCategoriesEntity subCategoriesEntity;
  SubCategoriesSuccessState(this.subCategoriesEntity);
}

class SubCategoriesErrorState extends CategoriesState {
  String error;
  SubCategoriesErrorState(this.error);
}
