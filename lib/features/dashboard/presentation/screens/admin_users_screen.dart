import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'id': 'USR-9901', 'name': 'John Doe', 'email': 'john.doe@example.com', 'role': 'User', 'status': 'Active'},
      {'id': 'USR-8821', 'name': 'Jane Doe', 'email': 'jane.doe@example.com', 'role': 'User', 'status': 'Active'},
      {'id': 'USR-1102', 'name': 'Admin Alpha', 'email': 'admin@novainsurance.com', 'role': 'Admin', 'status': 'Active'},
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
                Text('User Management', style: Theme.of(context).textTheme.headlineMedium),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add New User'),
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
                  DataColumn(label: Text('User ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Role')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: users.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user['id']!)),
                      DataCell(Text(user['name']!)),
                      DataCell(Text(user['email']!)),
                      DataCell(Text(user['role']!)),
                      DataCell(Chip(label: Text(user['status']!), backgroundColor: AppColors.success.withOpacity(0.1))),
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
