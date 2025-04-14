import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/resources/assets_manager.dart';
import 'package:ecom/core/resources/color_manager.dart';
import 'package:ecom/core/resources/styles_manager.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  CategoryDataEntity entity;
  CustomCategoryWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          imageUrl:entity.image??'',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
               ClipOval(
                 child: Image.asset(
                               ImageAssets.categoryHomeImage,
                               fit: BoxFit.cover,
                             ),
               ),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(100.r),
        //   child: Container(
        //     height: 100.h,
        //     width: 100.w,
        //     decoration: const BoxDecoration(shape: BoxShape.circle),
        //     child: Image.asset(
        //       ImageAssets.categoryHomeImage,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SizedBox(height: 8.h),
        Text(
          entity.name??'',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
