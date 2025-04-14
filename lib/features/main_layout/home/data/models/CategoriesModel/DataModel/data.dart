import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class CategoriesModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  CategoriesModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });
  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
  CategoryDataEntity  toEntity() => CategoryDataEntity(id: id,image: image,name: name);
}
