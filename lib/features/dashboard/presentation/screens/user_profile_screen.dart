import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/insurance_providers.dart';
import '../../../../shared/widgets/primary_button.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProfileAsync = ref.watch(userRepositoryProvider).getUserProfile();

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: userProfileAsync,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final profile = snapshot.data ?? {};
          _nameController.text = profile['name'] ?? '';
          _emailController.text = profile['email'] ?? '';
          _phoneController.text = profile['phone'] ?? '';
          _addressController.text = profile['address'] ?? '';

          return SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Profile', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Photo & KYC Info
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderLight),
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundColor: AppColors.secondary,
                            child: Icon(Icons.person, size: 60, color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          Text(profile['name'] ?? '', style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Chip(
                            label: Text(profile['kycStatus'] ?? 'Not Verified'),
                            backgroundColor: AppColors.success.withOpacity(0.1),
                            labelStyle: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Form fields
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Personal Details', style: Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 24),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _phoneController,
                                decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _addressController,
                                maxLines: 3,
                                decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
                              ),
                              const SizedBox(height: 32),
                              PrimaryButton(
                                text: 'Update Profile',
                                onPressed: () {
                                  ref.read(userRepositoryProvider).updateUserProfile({
                                    'name': _nameController.text,
                                    'email': _emailController.text,
                                    'phone': _phoneController.text,
                                    'address': _addressController.text,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Profile updated successfully!')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
