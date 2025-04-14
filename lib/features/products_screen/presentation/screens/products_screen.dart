import 'package:ecom/core/di/di.dart';
import 'package:ecom/core/resources/values_manager.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';
import 'package:ecom/features/products_screen/presentation/manager/cubit/products_view_model_cubit.dart';
import 'package:ecom/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  final String? categorieId;
  const ProductsScreen({super.key, this.categorieId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create:
          (context) =>
              getIt.get<ProductsViewModelCubit>()
                ..getCategorieProducts(categorieId!),
      child: Scaffold(
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<ProductsViewModelCubit, ProductsViewModelState>(
            buildWhen: (previous, current) {
              if (current is ProductsErrorState ||
                  current is ProductsSuccessState ||
                  current is ProductsLoadingState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if (state is ProductsSuccessState) {
                if ((state.productsEntity.results == 0)) {
              return    Center(child: Text('Not Avalable'));
                }
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.productsEntity.results?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 9,
                            ),
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            image:
                                state.productsEntity.data?[index].imageCover ??
                                '',
                            title:
                                state.productsEntity.data?[index].title ?? '',
                            price:
                                ((state.productsEntity.data?[index].price )?.toDouble()?? 000)
                                  ,
                            rating:
                                (
                                          (  state
                                        .productsEntity
                                            .data?[index]
                                            .ratingsAverage)?.toDouble() ??
                                        0),
                                    
                            discountPercentage:10,
                              
                            height: height,
                            width: width,
                            description:''
                              
                          );
                        },
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                );
              }
              if (state is ProductsErrorState) {
                return Center(child: Text(state.error));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
