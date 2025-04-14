import 'package:ecom/features/main_layout/categories/data/models/SubCatigoriesModel/sub_catigories_model.dart';
import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/home/data/models/BrandsResponse/brands_response.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/DataModel/data.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/MetaData/MetaData.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';
import 'package:ecom/features/products_screen/domain/Entity/ProductsEntity/products_entity.dart';

class ProductsModelResponse {
  int? results;
  String? message;
  String? statusMsg;
  Metadata? metadata;
  List<Product>? data;

  ProductsModelResponse({
    this.results,
    this.metadata,
    this.data,
    this.message,
    this.statusMsg,
  });

  ProductsModelResponse.fromJson(Map<String, dynamic> json) {
    results = json["results"];
    metadata =
        json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    data =
        json["data"] == null
            ? null
            : (json["data"] as List).map((e) => Product.fromJson(e)).toList();
  }

  static List<ProductsModelResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductsModelResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ProductsEntity toProductEntity() {
    return ProductsEntity(
      data: data?.map((entity) => entity.toProductEntity()).toList(),
      metadata: metadata?.toEntity(),
      results: results,
    );
  }
}

class Product {
  num? sold;
  List<String>? images;
  List<SubCategorieData>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  CategoriesModel? category;
  Brand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
  });

  Product.fromJson(Map<String, dynamic> json) {
    sold = json["sold"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    subcategory =
        json["subcategory"] == null
            ? null
            : (json["subcategory"] as List)
                .map((e) => SubCategorieData.fromJson(e))
                .toList();
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category =
        json["category"] == null
            ? null
            : CategoriesModel.fromJson(json["category"]);
    brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    priceAfterDiscount = json["priceAfterDiscount"];
  }

  static List<Product> fromList(List<Map<String, dynamic>> list) {
    return list.map(Product.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sold"] = sold;
    if (images != null) {
      _data["images"] = images;
    }
    if (subcategory != null) {
      _data["subcategory"] = subcategory?.map((e) => e.toJson()).toList();
    }
    _data["ratingsQuantity"] = ratingsQuantity;
    _data["_id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["priceAfterDiscount"] = priceAfterDiscount;

    _data["description"] = description;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["imageCover"] = imageCover;
    if (category != null) {
      _data["category"] = category?.toJson();
    }
    if (brand != null) {
      _data["brand"] = brand?.toJson();
    }
    _data["ratingsAverage"] = ratingsAverage;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["id"] = id;
    return _data;
  }

  ProductEntity toProductEntity() {
    return ProductEntity(
      brand: brand?.toBrandEntity(),
      category: category?.toEntity(),
      description: description,
      id: id,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory: subcategory?.map((sub) => sub.toSubDataEntity()).toList(),
      title: title,
      priceAfterDiscount: priceAfterDiscount,
    );
  }
}

// class Brand {
//   String? id;
//   String? name;
//   String? slug;
//   String? image;

//   Brand({this.id, this.name, this.slug, this.image});

//   Brand.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     name = json["name"];
//     slug = json["slug"];
//     image = json["image"];
//   }

//   static List<Brand> fromList(List<Map<String, dynamic>> list) {
//     return list.map(Brand.fromJson).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["image"] = image;
//     return _data;
//   }

//   BrandEntity toBrandEntity() {
//     return BrandEntity(id: id, image: image, name: name);
//   }
// }

// class Category {
//   String? id;
//   String? name;
//   String? slug;
//   String? image;

//   Category({this.id, this.name, this.slug, this.image});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     name = json["name"];
//     slug = json["slug"];
//     image = json["image"];
//   }

//   static List<Category> fromList(List<Map<String, dynamic>> list) {
//     return list.map(Category.fromJson).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["image"] = image;
//     return _data;
//   }

//   CategoryDataEntity toEntity() =>
//       CategoryDataEntity(id: id, image: image, name: name);
// }

// class Subcategory {
//   String? id;
//   String? name;
//   String? slug;
//   String? category;

//   Subcategory({this.id, this.name, this.slug, this.category});

//   Subcategory.fromJson(Map<String, dynamic> json) {
//     id = json["_id"];
//     name = json["name"];
//     slug = json["slug"];
//     category = json["category"];
//   }

//   static List<Subcategory> fromList(List<Map<String, dynamic>> list) {
//     return list.map(Subcategory.fromJson).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["_id"] = id;
//     _data["name"] = name;
//     _data["slug"] = slug;
//     _data["category"] = category;
//     return _data;
//   }

//   SubDataEntity toSubCategorieEntity() {
//     return SubDataEntity(id: id, category: category, name: name);
//   }
// }
