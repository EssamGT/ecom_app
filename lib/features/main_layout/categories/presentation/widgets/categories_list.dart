import 'package:ecom/core/resources/color_manager.dart';
import 'package:ecom/core/resources/values_manager.dart';
import 'package:ecom/features/main_layout/categories/presentation/manager/cubit/catigories_cubit.dart';
import 'package:ecom/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final List<CategoryDataEntity> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.containerGray,
          border: Border(
            // set the border for only 3 sides
            top: BorderSide(
              width: AppSize.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
            left: BorderSide(
              width: AppSize.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
            bottom: BorderSide(
              width: AppSize.s2,
              color: ColorManager.primary.withOpacity(0.3),
            ),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
        ),

        // the categories items list
        child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
          ),
          child: ListView.builder(
            itemCount: widget.categories.length,
            itemBuilder:
                (context, index) => CategoryItem(
                  index,
                  widget.categories[index].name ?? '',
                  selectedIndex == index,
                  onItemClick,
                ),
          ),
        ),
      ),
    );
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
      CategoriesCubit.get(
        context,
      ).selectCategorie(widget.categories[selectedIndex]);
    });
  }
}
