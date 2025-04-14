part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

class HomeLooading extends HomeViewModelState {}

class HomeSuccsess extends HomeViewModelState {
  CategoriesEntity categoriesEntity;
  HomeSuccsess(this.categoriesEntity);
}

class HomeError extends HomeViewModelState {
  String error;
  HomeError(this.error);
}

class BrandsLooadingState extends HomeViewModelState {}

class BrandsSuccsessState extends HomeViewModelState {
  BrandsEntity brandsEntity;
  BrandsSuccsessState(this.brandsEntity);
}

class BrandsErrorState extends HomeViewModelState {
  String error;
  BrandsErrorState(this.error);
}
