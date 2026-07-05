import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AdminProvidersScreen extends StatelessWidget {
  const AdminProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      {'name': 'HDFC Ergo', 'ratio': '98.2%', 'rating': '4.8', 'status': 'Active'},
      {'name': 'Star Health', 'ratio': '92.5%', 'rating': '4.5', 'status': 'Active'},
      {'name': 'LIC India', 'ratio': '99.1%', 'rating': '4.9', 'status': 'Active'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Provider Management', style: Theme.of(context).textTheme.headlineMedium),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Provider'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Provider Name')),
                  DataColumn(label: Text('Claim Ratio')),
                  DataColumn(label: Text('Rating')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: providers.map((prov) {
                  return DataRow(
                    cells: [
                      DataCell(Text(prov['name']!)),
                      DataCell(Text(prov['ratio']!)),
                      DataCell(Text(prov['rating']!)),
                      DataCell(Chip(label: Text(prov['status']!), backgroundColor: AppColors.success.withOpacity(0.1))),
                      DataCell(
                        Row(
                          children: [
                            IconButton(icon: const Icon(Icons.edit, color: AppColors.secondary), onPressed: () {}),
                            IconButton(icon: const Icon(Icons.delete, color: AppColors.danger), onPressed: () {}),
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
      ),
    );
  }
}
