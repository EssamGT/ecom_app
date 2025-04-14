import 'package:ecom/features/main_layout/categories/domain/Entity/sub_Categories_entity.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/MetaData/MetaData.dart';

class SubCatigoriesModel {
  int? results;
  Metadata? metadata;
  List<SubCategorieData>? data;

  SubCatigoriesModel({this.results, this.metadata, this.data});

  SubCatigoriesModel.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data =
          json["data"] == null
              ? null
              : (json["data"] as List).map((e) => SubCategorieData.fromJson(e)).toList();
    }
  }

  static List<SubCatigoriesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubCatigoriesModel.fromJson).toList();
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

  SubCategoriesEntity toSubCstegoriesEntity() {
    return SubCategoriesEntity(results: results, data: data?.map((data)=>data.toSubDataEntity()).toList());
  }
}

class SubCategorieData {
  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  SubCategorieData({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  SubCategorieData.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<SubCategorieData> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubCategorieData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["category"] = category;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }

  SubDataEntity toSubDataEntity() {
    return SubDataEntity(id: id, category: category, name: name);
  }
}
