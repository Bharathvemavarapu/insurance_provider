import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Health', 'description': 'Medical and hospitalization coverage', 'order': '1'},
      {'name': 'Life', 'description': 'Term life and security coverage', 'order': '2'},
      {'name': 'Car', 'description': 'Auto insurance policies', 'order': '3'},
      {'name': 'Travel', 'description': 'Worry-free international trip coverage', 'order': '4'},
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
                Text('Category Management', style: Theme.of(context).textTheme.headlineMedium),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Category'),
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
                  DataColumn(label: Text('Category Name')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Display Order')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: categories.map((cat) {
                  return DataRow(
                    cells: [
                      DataCell(Text(cat['name']!)),
                      DataCell(Text(cat['description']!)),
                      DataCell(Text(cat['order']!)),
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
