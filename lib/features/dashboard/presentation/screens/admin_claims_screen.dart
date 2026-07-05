import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/insurance_providers.dart';

class AdminClaimsScreen extends ConsumerStatefulWidget {
  const AdminClaimsScreen({super.key});

  @override
  ConsumerState<AdminClaimsScreen> createState() => _AdminClaimsScreenState();
}

class _AdminClaimsScreenState extends ConsumerState<AdminClaimsScreen> {
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
                Text('Claims Management', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Claim ID')),
                      DataColumn(label: Text('Policy ID')),
                      DataColumn(label: Text('Type')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: claims.map((claim) {
                      return DataRow(
                        cells: [
                          DataCell(Text(claim['id'])),
                          DataCell(Text(claim['policyId'])),
                          DataCell(Text(claim['type'])),
                          DataCell(Text(claim['amount'])),
                          DataCell(Chip(label: Text(claim['status']), backgroundColor: AppColors.warning.withOpacity(0.1))),
                          DataCell(
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Approved Claim ${claim['id']}')),
                                    );
                                  },
                                  child: const Text('Approve', style: TextStyle(color: AppColors.success)),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Rejected Claim ${claim['id']}')),
                                    );
                                  },
                                  child: const Text('Reject', style: TextStyle(color: AppColors.danger)),
                                ),
                              ],
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
