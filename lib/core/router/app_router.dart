import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/calculator/presentation/screens/calculator_screen.dart';
import '../../features/comparison/presentation/screens/comparison_screen.dart';

import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/dashboard/presentation/screens/user_profile_screen.dart';
import '../../features/dashboard/presentation/screens/user_policies_screen.dart';
import '../../features/dashboard/presentation/screens/user_claims_screen.dart';
import '../../features/dashboard/presentation/screens/user_documents_screen.dart';

import '../../features/dashboard/presentation/screens/admin_dashboard_screen.dart';
import '../../features/dashboard/presentation/screens/admin_users_screen.dart';
import '../../features/dashboard/presentation/screens/admin_providers_screen.dart';
import '../../features/dashboard/presentation/screens/admin_categories_screen.dart';
import '../../features/dashboard/presentation/screens/admin_claims_screen.dart';

import '../../shared/widgets/user_sidebar_shell.dart';
import '../../shared/widgets/admin_sidebar_shell.dart';

import '../../providers/auth_provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final path = state.uri.toString();
      final isLoggingIn = path == '/login';

      if (!authState.isAuthenticated) {
        // Force authentication unless they are already on /login
        return isLoggingIn ? null : '/login';
      }

      // Enforce dashboard separation based on active role
      if (authState.role == 'admin') {
        if (path.startsWith('/user') || isLoggingIn || path == '/') {
          return '/admin/dashboard';
        }
      } else {
        if (path.startsWith('/admin') || isLoggingIn || path == '/') {
          return '/user/dashboard';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/calculator',
        name: 'calculator',
        builder: (context, state) => const CalculatorScreen(),
      ),
      GoRoute(
        path: '/comparison',
        name: 'comparison',
        builder: (context, state) => const ComparisonScreen(),
      ),

      // User Dashboard Routes
      ShellRoute(
        builder: (context, state, child) => UserSidebarShell(child: child),
        routes: [
          GoRoute(
            path: '/user/dashboard',
            name: 'user_dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/user/profile',
            name: 'user_profile',
            builder: (context, state) => const UserProfileScreen(),
          ),
          GoRoute(
            path: '/user/policies',
            name: 'user_policies',
            builder: (context, state) => const UserPoliciesScreen(),
          ),
          GoRoute(
            path: '/user/claims',
            name: 'user_claims',
            builder: (context, state) => const UserClaimsScreen(),
          ),
          GoRoute(
            path: '/user/documents',
            name: 'user_documents',
            builder: (context, state) => const UserDocumentsScreen(),
          ),
        ],
      ),

      // Admin Dashboard Routes
      ShellRoute(
        builder: (context, state, child) => AdminSidebarShell(child: child),
        routes: [
          GoRoute(
            path: '/admin/dashboard',
            name: 'admin_dashboard',
            builder: (context, state) => const AdminDashboardScreen(),
          ),
          GoRoute(
            path: '/admin/users',
            name: 'admin_users',
            builder: (context, state) => const AdminUsersScreen(),
          ),
          GoRoute(
            path: '/admin/providers',
            name: 'admin_providers',
            builder: (context, state) => const AdminProvidersScreen(),
          ),
          GoRoute(
            path: '/admin/categories',
            name: 'admin_categories',
            builder: (context, state) => const AdminCategoriesScreen(),
          ),
          GoRoute(
            path: '/admin/claims',
            name: 'admin_claims',
            builder: (context, state) => const AdminClaimsScreen(),
          ),
        ],
      ),
    ],
  );
});
