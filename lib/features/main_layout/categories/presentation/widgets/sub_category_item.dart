import 'package:ecom/core/resources/color_manager.dart';
import 'package:ecom/core/resources/styles_manager.dart';
import 'package:ecom/core/resources/values_manager.dart';
import 'package:ecom/core/routes_manager/routes.dart';
import 'package:ecom/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String navigation;
  const SubCategoryItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductsScreen(categorieId: navigation),
          ),
        );
      },

      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: ColorManager.primary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(title, style: getRegularStyle(color: ColorManager.primary)),
        ],
      ),
    );
  }
}
