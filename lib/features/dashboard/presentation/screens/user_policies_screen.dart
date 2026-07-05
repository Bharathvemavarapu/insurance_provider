import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/insurance_providers.dart';

class UserPoliciesScreen extends ConsumerWidget {
  const UserPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final policiesFuture = ref.watch(policyRepositoryProvider).getUserPolicies();

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: policiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final policies = snapshot.data ?? [];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Policies', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Policy ID', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Provider', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Premium', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Renewal Date', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Coverage', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: policies.map((policy) {
                      return DataRow(
                        cells: [
                          DataCell(Text(policy['id'])),
                          DataCell(Text(policy['type'])),
                          DataCell(Text(policy['provider'])),
                          DataCell(Text(policy['premium'])),
                          DataCell(Text(policy['renewalDate'])),
                          DataCell(Text(policy['coverage'])),
                          DataCell(
                            Chip(
                              label: Text(policy['status']),
                              backgroundColor: AppColors.success.withOpacity(0.1),
                              labelStyle: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            TextButton(
                              onPressed: () {
                                ref.read(policyRepositoryProvider).renewPolicy(policy['id']);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Renewed policy ${policy['id']}')),
                                );
                              },
                              child: const Text('Renew Now'),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
