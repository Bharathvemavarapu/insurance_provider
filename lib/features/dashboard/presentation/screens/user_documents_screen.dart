import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class UserDocumentsScreen extends StatelessWidget {
  const UserDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final docs = [
      {'name': 'Health Insurance Policy PDF', 'type': 'PDF', 'size': '2.4 MB'},
      {'name': 'Car Insurance Certificate', 'type': 'PDF', 'size': '1.1 MB'},
      {'name': 'KYC Verification Document', 'type': 'JPG', 'size': '850 KB'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Documents', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: docs.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  return ListTile(
                    leading: const Icon(Icons.picture_as_pdf, color: AppColors.danger, size: 36),
                    title: Text(doc['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${doc['type']}  |  ${doc['size']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.remove_red_eye_outlined), onPressed: () {}),
                        IconButton(icon: const Icon(Icons.file_download_outlined), onPressed: () {}),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
