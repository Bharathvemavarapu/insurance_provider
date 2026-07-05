import '../models/insurance_provider.dart';

abstract class ProviderRepository {
  Future<List<InsuranceProvider>> getPopularProviders();
}

class FakeProviderRepository implements ProviderRepository {
  @override
  Future<List<InsuranceProvider>> getPopularProviders() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const InsuranceProvider(
        id: '1',
        name: 'HDFC Ergo',
        logoUrl: 'assets/images/hdfc.png',
        rating: 4.8,
        claimRatio: 98.2,
        description: 'India\'s leading health insurance provider.',
        officialWebsite: 'https://www.hdfcergo.com',
      ),
      const InsuranceProvider(
        id: '2',
        name: 'Star Health',
        logoUrl: 'assets/images/star.png',
        rating: 4.5,
        claimRatio: 92.5,
        description: 'Specialized health insurance company.',
        officialWebsite: 'https://www.starhealth.in',
      ),
    ];
  }
}
