import 'dart:async';

// A mock service to simulate server data fetching
class TemplateService {
  Future<List<Map<String, dynamic>>> fetchTemplates() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    return [
      {
        'id': 1,
        'name': 'Simple Free Resume',
        'image': 'assets/images/template_1.png',
        'isPremium': false,
        'category': 'Free',
        'discountedPrice': null,
        'originalPrice': null,
      },
      {
        'id': 2,
        'name': 'Modern ATS Resume',
        'image': 'assets/images/template_2.png',
        'isPremium': false,
        'category': 'ATS Free',
        'discountedPrice': null,
        'originalPrice': null,
      },
      {
        'id': 3,
        'name': 'Creative Premium CV',
        'image': 'assets/images/template_3.png',
        'isPremium': true,
        'category': 'Premium',
        'discountedPrice': 9.99,
        'originalPrice': 19.99,
      },
      {
        'id': 4,
        'name': 'ATS Professional Resume',
        'image': 'assets/images/template_4.png',
        'isPremium': true,
        'category': 'ATS Premium',
        'discountedPrice': 12.99,
        'originalPrice': 25.99,
      },
      {
        'id': 5,
        'name': 'Classic Free CV',
        'image': 'assets/images/template_1.png',
        'isPremium': false,
        'category': 'Free',
        'discountedPrice': null,
        'originalPrice': null,
      },
      {
        'id': 6,
        'name': 'Minimalist Premium Resume',
        'image': 'assets/images/template_2.png',
        'isPremium': true,
        'category': 'Premium',
        'discountedPrice': 7.99,
        'originalPrice': 14.99,
      },
      {
        'id': 7,
        'name': 'Discounted ATS Resume',
        'image': 'assets/images/template_3.png',
        'isPremium': true,
        'category': 'ATS Premium',
        'discountedPrice': 5.99,
        'originalPrice': 12.99,
      },
      {
        'id': 8,
        'name': 'Elegant Free Resume',
        'image': 'assets/images/template_4.png',
        'isPremium': false,
        'category': 'Free',
        'discountedPrice': null,
        'originalPrice': null,
      },
    ];
  }
}
