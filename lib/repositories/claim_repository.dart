abstract class ClaimRepository {
  Future<List<Map<String, dynamic>>> getClaims();
  Future<bool> raiseClaim(Map<String, dynamic> claimData);
}

class FakeClaimRepository implements ClaimRepository {
  final List<Map<String, dynamic>> _mockClaims = [
    {
      'id': 'CLM-88371',
      'policyId': 'POL-100234',
      'type': 'Health',
      'amount': '₹45,000',
      'status': 'Under Review',
      'dateRaised': '2026-07-01',
      'timeline': [
        {'title': 'Claim Submitted', 'date': '2026-07-01', 'done': true},
        {'title': 'Documents Verified', 'date': '2026-07-03', 'done': true},
        {'title': 'Under Review', 'date': '2026-07-04', 'done': true},
        {'title': 'Approved & Disbursed', 'date': 'Pending', 'done': false},
      ]
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> getClaims() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _mockClaims;
  }

  @override
  Future<bool> raiseClaim(Map<String, dynamic> claimData) async {
    await Future.delayed(const Duration(milliseconds: 600));
    _mockClaims.add({
      'id': 'CLM-${(10000 + _mockClaims.length).toString()}',
      'policyId': claimData['policyId'] ?? 'N/A',
      'type': claimData['type'] ?? 'Health',
      'amount': '₹${claimData['amount'] ?? '0'}',
      'status': 'Submitted',
      'dateRaised': DateTime.now().toString().split(' ')[0],
      'timeline': [
        {'title': 'Claim Submitted', 'date': DateTime.now().toString().split(' ')[0], 'done': true},
        {'title': 'Documents Verified', 'date': 'Pending', 'done': false},
        {'title': 'Under Review', 'date': 'Pending', 'done': false},
        {'title': 'Approved & Disbursed', 'date': 'Pending', 'done': false},
      ]
    });
    return true;
  }
}
