abstract class NotificationRepository {
  Future<List<Map<String, dynamic>>> getNotifications();
  Future<bool> sendNotification(Map<String, dynamic> notification);
}

class FakeNotificationRepository implements NotificationRepository {
  final List<Map<String, dynamic>> _mockNotifications = [
    {
      'id': '1',
      'title': 'Renewal Reminder',
      'body': 'Your HDFC Ergo policy expires in 15 days. Renew now to avoid break in coverage.',
      'type': 'Renewal',
      'timestamp': '2 hours ago',
    },
    {
      'id': '2',
      'title': 'Claim Status Update',
      'body': 'Your claim CLM-88371 status has updated to "Under Review".',
      'type': 'Claim',
      'timestamp': '1 day ago',
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> getNotifications() async {
    return _mockNotifications;
  }

  @override
  Future<bool> sendNotification(Map<String, dynamic> notification) async {
    _mockNotifications.insert(0, {
      'id': (_mockNotifications.length + 1).toString(),
      'title': notification['title'] ?? 'Notice',
      'body': notification['body'] ?? '',
      'type': notification['type'] ?? 'General',
      'timestamp': 'Just now',
    });
    return true;
  }
}
