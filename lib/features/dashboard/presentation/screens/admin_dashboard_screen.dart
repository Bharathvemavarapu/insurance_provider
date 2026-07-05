import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../providers/insurance_providers.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsFuture = ref.watch(analyticsRepositoryProvider).getAdminDashboardAnalytics();

    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: analyticsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? {};
          final totalUsers = data['totalUsers'].toString();
          final totalPolicies = data['totalPolicies'].toString();
          final totalRevenue = '₹${data['totalRevenue'].toString()}';
          final todayVisitors = data['todayVisitors'].toString();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Admin Overview', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 32),
                
                // Stat Cards Grid
                Row(
                  children: [
                    _StatCard(title: 'Total Users', value: totalUsers, icon: Icons.people, color: AppColors.secondary),
                    const SizedBox(width: 20),
                    _StatCard(title: 'Total Policies', value: totalPolicies, icon: Icons.folder, color: AppColors.success),
                    const SizedBox(width: 20),
                    _StatCard(title: 'Total Revenue', value: totalRevenue, icon: Icons.monetization_on, color: AppColors.accent),
                    const SizedBox(width: 20),
                    _StatCard(title: 'Today\'s Visitors', value: todayVisitors, icon: Icons.visibility, color: AppColors.warning),
                  ],
                ),
                
                const SizedBox(height: 48),
                
                // Charts & Analytics Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Line chart for Revenue
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 350,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Revenue Growth (H1)', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 24),
                            Expanded(
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: true),
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (val, meta) {
                                          final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                                          if (val >= 0 && val < months.length) {
                                            return Text(months[val.toInt()]);
                                          }
                                          return const Text('');
                                        },
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: const [
                                        FlSpot(0, 12),
                                        FlSpot(1, 15),
                                        FlSpot(2, 18),
                                        FlSpot(3, 22),
                                        FlSpot(4, 28),
                                        FlSpot(5, 35),
                                      ],
                                      isCurved: true,
                                      color: AppColors.secondary,
                                      barWidth: 4,
                                      dotData: FlDotData(show: true),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Pie breakdown
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 350,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category Breakdown', style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 24),
                            Expanded(
                              child: PieChart(
                                PieChartData(
                                  sections: [
                                    PieChartSectionData(color: AppColors.secondary, value: 40, title: 'Health 40%', radius: 50, titleStyle: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                    PieChartSectionData(color: AppColors.success, value: 25, title: 'Life 25%', radius: 50, titleStyle: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                    PieChartSectionData(color: AppColors.accent, value: 20, title: 'Car 20%', radius: 50, titleStyle: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                    PieChartSectionData(color: AppColors.warning, value: 15, title: 'Other 15%', radius: 50, titleStyle: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ],
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

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(title, style: const TextStyle(color: AppColors.textMutedLight)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
