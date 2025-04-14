import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/MetaDataEntity/Meta_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MetaData.g.dart';

@JsonSerializable()
class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  Metadata({this.currentPage, this.numberOfPages, this.limit});
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
  toEntity() => MetaDataEntity(
    currentPage: currentPage,
    numberOfPages: numberOfPages,
    limit: limit,
  );
}
