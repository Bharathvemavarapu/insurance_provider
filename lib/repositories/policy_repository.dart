abstract class PolicyRepository {
  Future<List<Map<String, dynamic>>> getUserPolicies();
  Future<bool> renewPolicy(String policyId);
}

class FakePolicyRepository implements PolicyRepository {
  final List<Map<String, dynamic>> _mockPolicies = [
    {
      'id': 'POL-100234',
      'type': 'Health',
      'provider': 'HDFC Ergo',
      'premium': '₹12,500',
      'renewalDate': '2026-07-20',
      'coverage': '₹5,00,000',
      'status': 'Active',
    },
    {
      'id': 'POL-993821',
      'type': 'Car',
      'provider': 'Star Health',
      'premium': '₹6,200',
      'renewalDate': '2027-01-15',
      'coverage': '₹3,00,000',
      'status': 'Active',
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> getUserPolicies() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockPolicies;
  }

  @override
  Future<bool> renewPolicy(String policyId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final index = _mockPolicies.indexWhere((p) => p['id'] == policyId);
    if (index != -1) {
      _mockPolicies[index]['renewalDate'] = DateTime.now().add(const Duration(days: 365)).toString().split(' ')[0];
      return true;
    }
    return false;
  }
}
