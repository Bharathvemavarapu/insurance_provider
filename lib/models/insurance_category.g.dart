// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsuranceCategory _$InsuranceCategoryFromJson(Map<String, dynamic> json) =>
    _InsuranceCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
      description: json['description'] as String,
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$InsuranceCategoryToJson(_InsuranceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'description': instance.description,
      'isPopular': instance.isPopular,
    };
