// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoriesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponce _$CategoriesResponceFromJson(Map<String, dynamic> json) =>
    CategoriesResponce(
      results: (json['results'] as num?)?.toInt(),
      metaData:
          json['metaData'] == null
              ? null
              : Metadata.fromJson(json['metaData'] as Map<String, dynamic>),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoriesResponceToJson(CategoriesResponce instance) =>
    <String, dynamic>{
      'results': instance.results,
      'metaData': instance.metaData,
      'data': instance.data,
    };
