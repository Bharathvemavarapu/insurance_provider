import '../models/insurance_category.dart';

abstract class InsuranceRepository {
  Future<List<InsuranceCategory>> getCategories();
  Future<InsuranceCategory> getCategoryById(String id);
}

class FakeInsuranceRepository implements InsuranceRepository {
  @override
  Future<List<InsuranceCategory>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const InsuranceCategory(id: '1', name: 'Health', iconUrl: 'assets/icons/health.svg', description: 'Comprehensive health coverage', isPopular: true),
      const InsuranceCategory(id: '2', name: 'Life', iconUrl: 'assets/icons/life.svg', description: 'Secure your family\'s future', isPopular: true),
      const InsuranceCategory(id: '3', name: 'Car', iconUrl: 'assets/icons/car.svg', description: 'Auto insurance made simple', isPopular: true),
      const InsuranceCategory(id: '4', name: 'Travel', iconUrl: 'assets/icons/travel.svg', description: 'Travel the world worry-free', isPopular: false),
    ];
  }

  @override
  Future<InsuranceCategory> getCategoryById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const InsuranceCategory(id: '1', name: 'Health', iconUrl: 'assets/icons/health.svg', description: 'Comprehensive health coverage');
  }
}
