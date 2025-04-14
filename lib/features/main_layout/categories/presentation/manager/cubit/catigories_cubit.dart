import 'package:bloc/bloc.dart';
import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/categories/domain/UseCase/Categories_Use_Case.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';
import 'package:ecom/features/main_layout/home/domain/useCase/home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'catigories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  HomeUseCase useCase;
  @factoryMethod
  CategoriesCubit(this.useCase, this.subCategoriesUseCase)
    : super(CatigoriesInitial());
  static CategoriesCubit get(BuildContext context) => BlocProvider.of(context);
  CategoryDataEntity? slectedEntity;
  getCategories() async {
    emit(CategoriesLoaddingState());
    var resault = await useCase.call();
    resault.fold(
      (response) {
        slectedEntity = response.data?[0];
        getSubCategories();
        emit(CategoriesSuccessState(response));
      },
      (error) {
        emit(CategoriesErrorState(error));
      },
    );
  }

  selectCategorie(CategoryDataEntity neww) {
    slectedEntity = neww;
    getSubCategories();
    emit(CategoriesNewState());
  }

  SubCategoriesUseCase subCategoriesUseCase;
  getSubCategories() async {
    emit(SubCategoriesLoaddingState());
    var response = await subCategoriesUseCase.call(slectedEntity?.id ?? '');
    response.fold(
      (subCategoriesEntity) {
        emit(SubCategoriesSuccessState(subCategoriesEntity));
      },
      (error) {
        emit(SubCategoriesErrorState(error));
      },
    );
  }
}
