import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/resources/assets_manager.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  final BrandEntity brandEntity;
  const CustomBrandWidget(this.brandEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 80.h,
      width: 80.w,
      fit: BoxFit.cover,
      imageUrl: brandEntity.image ?? '',
      placeholder:
          (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget:
          (context, url, error) => const Center(child: Icon(Icons.error)),
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                alignment: Alignment.center,
                scale: 3,
                image: imageProvider,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        );
      },
    );
  }
}


        

    //     Column(
    //   children: [
    //     ClipRRect(
    //       borderRadius: BorderRadius.circular(100.r),
    //       child: Container(
    //         height: 100.h,
    //         width: 100.w,
    //         decoration: const BoxDecoration(shape: BoxShape.circle),
    //         child: Image.asset(
    //           ImageAssets.brandHomeImage,
    //           fit: BoxFit.scaleDown,
    //         ),
    //       ),
    //     ),
    //   ],
    // );