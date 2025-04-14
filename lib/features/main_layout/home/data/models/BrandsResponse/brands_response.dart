import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/MetaData/MetaData.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/BrandsEntity/brands_entity.dart';

class BrandsResponse {
  int? results;
  Metadata? metadata;
  List<Brand>? brand;

  BrandsResponse({this.results, this.metadata, this.brand});

  BrandsEntity toBrandesEntity() => BrandsEntity(
    results: results,
    metadata: metadata?.toEntity(),
    brand: brand?.map((brand) => brand.toBrandEntity()).toList(),
  );

  BrandsResponse.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      brand =
          json["data"] == null
              ? null
              : (json["data"] as List).map((e) => Brand.fromJson(e)).toList();
    }
  }

  static List<BrandsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(BrandsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (brand != null) {
      _data["data"] = brand?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<Brand> fromList(List<Map<String, dynamic>> list) {
    return list.map(Brand.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }

  BrandEntity toBrandEntity() => BrandEntity(id: id, image: image, name: name);
}
