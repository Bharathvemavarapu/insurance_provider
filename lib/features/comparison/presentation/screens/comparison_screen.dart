import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compare Plans')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.borderLight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 30,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Table(
            border: TableBorder.all(color: AppColors.borderLight, width: 1, borderRadius: BorderRadius.circular(24)),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            children: [
              _buildHeaderRow(),
              _buildRow('Premium / Year', '₹12,500', '₹11,200'),
              _buildRow('Coverage', '₹5,00,000', '₹5,00,000'),
              _buildRow('Waiting Period', '2 Years', '3 Years'),
              _buildRow('Network Hospitals', '8,500+', '6,000+'),
              _buildRow('Claim Ratio', '98.2%', '92.5%'),
              _buildRow('Co-pay', 'No', '20% after 60 years'),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Features', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('HDFC Ergo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                child: const Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Star Health', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary, padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                child: const Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildRow(String feature, String plan1, String plan2) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(feature, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textMutedLight)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(plan1, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(plan2, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
        ),
      ],
    );
  }
}
