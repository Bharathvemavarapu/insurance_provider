import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/auth_provider.dart';

class UserSidebarShell extends ConsumerWidget {
  final Widget child;

  const UserSidebarShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.shield, color: AppColors.secondary),
            SizedBox(width: 8),
            Text('NovaUser Console', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authStateProvider.notifier).logout();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: !isDesktop
          ? Drawer(child: _buildSidebar(context, showLogo: true))
          : null,
      body: Row(
        children: [
          if (isDesktop)
            Container(
              width: 260,
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: AppColors.borderLight)),
                color: Colors.white,
              ),
              child: _buildSidebar(context),
            ),
          Expanded(
            child: Container(
              color: AppColors.bgLight,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context, {bool showLogo = false}) {
    final items = [
      _SidebarItem(icon: Icons.dashboard, title: 'Dashboard', path: '/user/dashboard'),
      _SidebarItem(icon: Icons.person, title: 'My Profile', path: '/user/profile'),
      _SidebarItem(icon: Icons.folder, title: 'My Policies', path: '/user/policies'),
      _SidebarItem(icon: Icons.compare, title: 'Compare Insurance', path: '/comparison'),
      _SidebarItem(icon: Icons.calculate, title: 'Premium Calculator', path: '/calculator'),
      _SidebarItem(icon: Icons.history, title: 'Claims', path: '/user/claims'),
      _SidebarItem(icon: Icons.description, title: 'Documents', path: '/user/documents'),
    ];

    final currentRoute = GoRouterState.of(context).uri.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLogo)
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: const [
                Icon(Icons.shield, color: AppColors.secondary),
                SizedBox(width: 8),
                Text('NovaInsurance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isActive = currentRoute == item.path;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(
                    item.icon,
                    color: isActive ? AppColors.secondary : AppColors.textMutedLight,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      color: isActive ? AppColors.secondary : AppColors.textMainLight,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  selected: isActive,
                  selectedTileColor: AppColors.secondary.withOpacity(0.08),
                  onTap: () {
                    context.go(item.path);
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SidebarItem {
  final IconData icon;
  final String title;
  final String path;

  _SidebarItem({required this.icon, required this.title, required this.path});
}
