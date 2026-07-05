abstract class AnalyticsRepository {
  Future<Map<String, dynamic>> getAdminDashboardAnalytics();
}

class FakeAnalyticsRepository implements AnalyticsRepository {
  @override
  Future<Map<String, dynamic>> getAdminDashboardAnalytics() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {
      'totalUsers': 14205,
      'totalProviders': 12,
      'totalPolicies': 8920,
      'totalRevenue': 2450800.0,
      'todayVisitors': 1402,
      'todayRegistrations': 84,
      'totalComparisons': 23049,
      'activeClaims': 18,
      'pendingClaims': 7,
      'newSupportTickets': 4,
      'systemHealth': '99.98%',
      'revenueHistory': [
        {'month': 'Jan', 'revenue': 120000.0},
        {'month': 'Feb', 'revenue': 150000.0},
        {'month': 'Mar', 'revenue': 180000.0},
        {'month': 'Apr', 'revenue': 220000.0},
        {'month': 'May', 'revenue': 280000.0},
        {'month': 'Jun', 'revenue': 350000.0},
      ],
      'categoryBreakdown': [
        {'name': 'Health', 'value': 40},
        {'name': 'Life', 'value': 25},
        {'name': 'Car', 'value': 20},
        {'name': 'Other', 'value': 15},
      ]
    };
  }
}
