abstract class ReviewRepository {
  Future<List<Map<String, dynamic>>> getReviews();
  Future<bool> submitReview(Map<String, dynamic> review);
  Future<bool> approveReview(String reviewId);
  Future<bool> rejectReview(String reviewId);
}

class FakeReviewRepository implements ReviewRepository {
  final List<Map<String, dynamic>> _mockReviews = [
    {
      'id': 'REV-1',
      'user': 'Rohan Sharma',
      'rating': 5,
      'comment': 'Awesome portal, comparing health insurance was super fast and clean.',
      'status': 'Approved',
    },
    {
      'id': 'REV-2',
      'user': 'Ananya Sen',
      'rating': 4,
      'comment': 'Really liked the clean UI, and calculator was helpful.',
      'status': 'Pending',
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> getReviews() async {
    return _mockReviews;
  }

  @override
  Future<bool> submitReview(Map<String, dynamic> review) async {
    _mockReviews.add({
      'id': 'REV-${_mockReviews.length + 1}',
      'user': review['user'] ?? 'Anonymous',
      'rating': review['rating'] ?? 5,
      'comment': review['comment'] ?? '',
      'status': 'Pending',
    });
    return true;
  }

  @override
  Future<bool> approveReview(String reviewId) async {
    final index = _mockReviews.indexWhere((r) => r['id'] == reviewId);
    if (index != -1) {
      _mockReviews[index]['status'] = 'Approved';
      return true;
    }
    return false;
  }

  @override
  Future<bool> rejectReview(String reviewId) async {
    final index = _mockReviews.indexWhere((r) => r['id'] == reviewId);
    if (index != -1) {
      _mockReviews[index]['status'] = 'Rejected';
      return true;
    }
    return false;
  }
}
