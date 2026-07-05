import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/primary_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgLight, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: AppColors.secondary, size: 16),
                const SizedBox(width: 8),
                Text(
                  'INDIA\'S #1 INSURANCE MARKETPLACE',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ).animate().fade(duration: 500.ms).slideY(begin: 0.5, end: 0),
          const SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 48),
              children: const [
                TextSpan(text: 'Every Insurance.\nOne '),
                TextSpan(
                  text: 'Trusted Platform.',
                  style: TextStyle(color: AppColors.secondary),
                ),
              ],
            ),
          ).animate().fade(delay: 200.ms, duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 24),
          Text(
            'Compare health, vehicle, life, and travel policies from top insurers side-by-side.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textMutedLight,
              fontSize: 18,
            ),
          ).animate().fade(delay: 400.ms, duration: 600.ms),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: 'Find My Plan',
                onPressed: () {},
                icon: Icons.search,
              ),
              const SizedBox(width: 16),
              PrimaryButton(
                text: 'Talk to Expert',
                onPressed: () {},
                isOutline: true,
                icon: Icons.phone_outlined,
              ),
            ],
          ).animate().fade(delay: 600.ms, duration: 600.ms),
        ],
      ),
    );
  }
}
