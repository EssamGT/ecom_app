import 'package:ecom/features/main_layout/home/domain/Entity/Categories_Entity/MetaDataEntity/Meta_data_entity.dart';

class BrandsEntity {
  int? results;
  MetaDataEntity? metadata;
  List<BrandEntity>? brand;

  BrandsEntity({this.results, this.metadata, this.brand});
}

class BrandEntity {
  String? id;
  String? name;
  String? image;
  BrandEntity({this.id, this.name, this.image});
}
