import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/insurance_repository.dart';
import '../repositories/provider_repository.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/user_repository.dart';
import '../repositories/policy_repository.dart';
import '../repositories/claim_repository.dart';
import '../repositories/review_repository.dart';
import '../repositories/notification_repository.dart';
import '../repositories/analytics_repository.dart';
import '../repositories/settings_repository.dart';

import '../models/insurance_category.dart';
import '../models/insurance_provider.dart';

// Repository Providers
final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  return FirebaseAuthenticationRepository();
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FakeUserRepository();
});

final insuranceRepositoryProvider = Provider<InsuranceRepository>((ref) {
  return FakeInsuranceRepository();
});

final providerRepositoryProvider = Provider<ProviderRepository>((ref) {
  return FakeProviderRepository();
});

final policyRepositoryProvider = Provider<PolicyRepository>((ref) {
  return FakePolicyRepository();
});

final claimRepositoryProvider = Provider<ClaimRepository>((ref) {
  return FakeClaimRepository();
});

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return FakeReviewRepository();
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return FakeNotificationRepository();
});

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return FakeAnalyticsRepository();
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return FakeSettingsRepository();
});

// Future Providers
final categoriesProvider = FutureProvider<List<InsuranceCategory>>((ref) {
  final repo = ref.watch(insuranceRepositoryProvider);
  return repo.getCategories();
});

final popularInsuranceProvidersProvider = FutureProvider<List<InsuranceProvider>>((ref) {
  final repo = ref.watch(providerRepositoryProvider);
  return repo.getPopularProviders();
});
