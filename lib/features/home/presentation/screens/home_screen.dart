import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/hero_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/providers_section.dart';
import '../widgets/chatbot_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.shield, color: AppColors.secondary),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22),
                children: const [
                  TextSpan(text: 'Nova'),
                  TextSpan(
                    text: 'Insurance',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => context.go('/'), child: const Text('Home')),
          TextButton(onPressed: () => context.go('/calculator'), child: const Text('Calculator')),
          TextButton(onPressed: () => context.go('/comparison'), child: const Text('Compare')),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () => context.go('/login'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const CategoriesSection(),
            const ProvidersSection(),
            // Add other sections like Comparison, Calculator, FAQ here
            const SizedBox(height: 80),
            const _FooterSection(),
          ],
        ),
      ),
      floatingActionButton: const ChatbotFab(),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.shield, color: AppColors.secondary, size: 32),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    children: const [
                      TextSpan(text: 'Nova'),
                      TextSpan(
                        text: 'Insurance',
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '© 2026 NovaInsurance. All rights reserved.',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
