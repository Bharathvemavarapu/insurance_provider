import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_provider.freezed.dart';
part 'insurance_provider.g.dart';

@freezed
sealed class InsuranceProvider with _$InsuranceProvider {
  const factory InsuranceProvider({
    required String id,
    required String name,
    required String logoUrl,
    required double rating,
    required double claimRatio,
    required String description,
    required String officialWebsite,
  }) = _InsuranceProvider;

  factory InsuranceProvider.fromJson(Map<String, dynamic> json) =>
      _$InsuranceProviderFromJson(json);
}
