import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/MetaDataEntity/Meta_data_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';

class ProductsEntity {
  int? results;
  String? message;
  String? statusMsg;
  MetaDataEntity? metadata;
  List<ProductEntity>? data;

  ProductsEntity({
    this.results,
    this.metadata,
    this.data,
    this.message,
    this.statusMsg,
  });
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubDataEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryDataEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;
  num? priceAfterDiscount;

  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.priceAfterDiscount,
  });
}
