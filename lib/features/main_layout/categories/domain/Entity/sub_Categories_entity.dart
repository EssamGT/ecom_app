import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/MetaDataEntity/Meta_data_entity.dart';

class SubCategoriesEntity {
  int? results;
  MetaDataEntity? metadata;
  List<SubDataEntity>? data;
  SubCategoriesEntity({this.results, this.data, this.metadata});
}

class SubDataEntity {
  String? id;
  String? name;
  String? category;

  SubDataEntity({
    this.id,
    this.name,
    this.category,
  });
}
