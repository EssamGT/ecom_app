part of 'products_view_model_cubit.dart';

@immutable
sealed class ProductsViewModelState {}

final class ProductsViewModelInitial extends ProductsViewModelState {}

class ProductsLoadingState extends ProductsViewModelState {}

class ProductsSuccessState extends ProductsViewModelState {
  ProductsEntity productsEntity;
  ProductsSuccessState(this.productsEntity);
}

class ProductsErrorState extends ProductsViewModelState {
  String error;
  ProductsErrorState(this.error);
}
