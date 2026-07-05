import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/insurance_providers.dart';
import '../../../../shared/widgets/primary_button.dart';

class UserClaimsScreen extends ConsumerStatefulWidget {
  const UserClaimsScreen({super.key});

  @override
  ConsumerState<UserClaimsScreen> createState() => _UserClaimsScreenState();
}

class _UserClaimsScreenState extends ConsumerState<UserClaimsScreen> {
  final _amountController = TextEditingController();
  String _claimType = 'Health';

  void _showRaiseClaimDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Raise New Claim'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _claimType,
              items: const [
                DropdownMenuItem(value: 'Health', child: Text('Health')),
                DropdownMenuItem(value: 'Car', child: Text('Car')),
                DropdownMenuItem(value: 'Life', child: Text('Life')),
              ],
              onChanged: (val) => setState(() => _claimType = val!),
              decoration: const InputDecoration(labelText: 'Claim Type'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount (₹)', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              ref.read(claimRepositoryProvider).raiseClaim({
                'type': _claimType,
                'amount': _amountController.text,
              });
              Navigator.pop(context);
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Claim submitted successfully!')),
              );
            },
            child: const Text('Submit Claim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final claimsFuture = ref.watch(claimRepositoryProvider).getClaims();

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: claimsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final claims = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Claims Status', style: Theme.of(context).textTheme.headlineMedium),
                    PrimaryButton(
                      text: 'Raise New Claim',
                      onPressed: _showRaiseClaimDialog,
                      icon: Icons.add,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ...claims.map((claim) {
                  final timeline = claim['timeline'] as List<dynamic>;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Claim ID: ${claim['id']}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Chip(
                              label: Text(claim['status']),
                              backgroundColor: AppColors.warning.withOpacity(0.1),
                              labelStyle: const TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Amount: ${claim['amount']}  |  Date Raised: ${claim['dateRaised']}'),
                        const SizedBox(height: 24),
                        const Text('Claim Progress Timeline', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: timeline.map((step) {
                            final isDone = step['done'] as bool;
                            return Expanded(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: isDone ? AppColors.success : AppColors.borderLight,
                                    child: const Icon(Icons.check, size: 12, color: Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    step['title'],
                                    style: TextStyle(
                                      fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(step['date'], style: const TextStyle(fontSize: 10, color: AppColors.textMutedLight)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
