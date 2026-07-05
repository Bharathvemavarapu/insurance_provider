// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsuranceProvider _$InsuranceProviderFromJson(Map<String, dynamic> json) =>
    _InsuranceProvider(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      claimRatio: (json['claimRatio'] as num).toDouble(),
      description: json['description'] as String,
      officialWebsite: json['officialWebsite'] as String,
    );

Map<String, dynamic> _$InsuranceProviderToJson(_InsuranceProvider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'rating': instance.rating,
      'claimRatio': instance.claimRatio,
      'description': instance.description,
      'officialWebsite': instance.officialWebsite,
    };
