abstract class UserRepository {
  Future<Map<String, dynamic>> getUserProfile();
  Future<bool> updateUserProfile(Map<String, dynamic> data);
}

class FakeUserRepository implements UserRepository {
  Map<String, dynamic> _mockProfile = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '+91 98765 43210',
    'address': '123, Park Avenue, Sector 4, Bangalore, India',
    'nomineeName': 'Jane Doe',
    'nomineeRelation': 'Spouse',
    'kycStatus': 'Verified',
  };

  @override
  Future<Map<String, dynamic>> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockProfile;
  }

  @override
  Future<bool> updateUserProfile(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockProfile = {..._mockProfile, ...data};
    return true;
  }
}
