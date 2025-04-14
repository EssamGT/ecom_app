import 'package:ecom/core/resources/assets_manager.dart';
import 'package:ecom/core/resources/color_manager.dart';
import 'package:ecom/core/resources/font_manager.dart';
import 'package:ecom/core/resources/values_manager.dart';
import 'package:ecom/core/routes_manager/routes.dart';
import 'package:ecom/features/main_layout/categories/presentation/manager/cubit/catigories_cubit.dart';
import 'package:ecom/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/styles_manager.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) {
        if (current is CategoriesNewState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  CategoriesCubit.get(context).slectedEntity?.name ?? '',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  CategoriesCubit.get(context).slectedEntity?.name ?? '',
                  CategoriesCubit.get(context).slectedEntity?.image ?? '',
                  goToCategoryProductsListScreen,
                ),
              ),
              // the grid view of the subcategories
              BlocBuilder<CategoriesCubit, CategoriesState>(
                buildWhen: (previous, current) {
                  if (current is SubCategoriesLoaddingState ||
                      current is SubCategoriesErrorState ||
                      current is SubCategoriesSuccessState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is SubCategoriesSuccessState) {
                    if ((state.subCategoriesEntity.results ?? 0) == 0) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text('No Sub Categories')),
                      );
                    }
                    return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.subCategoriesEntity.results ?? 0,
                        (context, index) => SubCategoryItem(
                          state.subCategoriesEntity.data?[index].name ?? '',
                          ImageAssets.subcategoryCardImage,
                          CategoriesCubit.get(context).slectedEntity?.id ?? '',
                        ),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 1.9,
                            mainAxisSpacing: AppSize.s8,
                            crossAxisSpacing: AppSize.s8,
                          ),
                    );
                  }
                  if (state is SubCategoriesErrorState) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.error)),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  goToCategoryProductsListScreen(BuildContext context,ProductsEntity categorieId) {
    Navigator.pushNamed(context, Routes.productsScreenRoute,
    arguments: {
      'id': categorieId
    }
    );
  }
}
