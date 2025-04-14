import 'package:bloc/bloc.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';
import 'package:ecom/features/products_screen/domain/UseCase/products_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  @factoryMethod
  ProductsViewModelCubit(this.useCase) : super(ProductsViewModelInitial());
  ProductsUseCase useCase;
  getCategorieProducts(String categorieId) async {
    emit(ProductsLoadingState());
    var result = await useCase.call(categorieId);
    result.fold(
      (response) {
        emit(ProductsSuccessState(response));
      },
      (error) {
        emit(ProductsErrorState(error));
      },
    );
  }
}
