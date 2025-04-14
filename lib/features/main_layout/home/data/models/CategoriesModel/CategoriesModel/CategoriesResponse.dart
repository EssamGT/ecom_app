import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/DataModel/data.dart';
import 'package:ecom/features/main_layout/home/data/models/CategoriesModel/MetaData/MetaData.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/Categories_Entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CategoriesResponse.g.dart';

@JsonSerializable()
class CategoriesResponce {
  int? results;
  Metadata? metaData;
  List<CategoriesModel>? data;
  CategoriesResponce({this.results, this.metaData, this.data});
  factory CategoriesResponce.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponceFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponceToJson(this);
   CategoriesEntity toCategoriesEntity() => CategoriesEntity(
    data: data?.map((data)=>data.toEntity()).toList(),
    metaData: metaData?.toEntity(),
    results: results,
  );
}
