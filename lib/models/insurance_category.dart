import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_category.freezed.dart';
part 'insurance_category.g.dart';

@freezed
sealed class InsuranceCategory with _$InsuranceCategory {
  const factory InsuranceCategory({
    required String id,
    required String name,
    required String iconUrl,
    required String description,
    @Default(false) bool isPopular,
  }) = _InsuranceCategory;

  factory InsuranceCategory.fromJson(Map<String, dynamic> json) =>
      _$InsuranceCategoryFromJson(json);
}
