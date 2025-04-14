import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/MetaDataEntity/Meta_data_entity.dart';
import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/data_entity/data_entity.dart';

class CategoriesEntity {
  int? results;
  MetaDataEntity? metaData;
  List<CategoryDataEntity>? data;
  CategoriesEntity({this.results, this.metaData, this.data});
}