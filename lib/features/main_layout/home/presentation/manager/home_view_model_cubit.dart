import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:ecom/features/main_layout/home/domain/useCase/home_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  @factoryMethod
  HomeViewModelCubit(this.useCase) : super(HomeViewModelInitial());
  HomeUseCase useCase;
  getCatigories() async {
    emit(HomeLooading());
    var result = await useCase.call();
    result.fold(
      (response) {
        emit(HomeSuccsess(response));
      },
      (error) {
        emit(HomeError(error));
      },
    );
  }

  getBrands() async {
    emit(BrandsLooadingState());
    var result = await useCase.callBrands();
    result.fold(
      (response) {
        emit(BrandsSuccsessState(response));
      },
      (error) {
        emit(BrandsErrorState(error));
      },
    );
  }
}
