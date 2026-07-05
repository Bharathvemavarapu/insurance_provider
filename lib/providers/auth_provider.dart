import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'insurance_providers.dart';

class AuthState {
  final String role;
  final bool isAuthenticated;

  AuthState({required this.role, required this.isAuthenticated});

  AuthState copyWith({String? role, bool? isAuthenticated}) {
    return AuthState(
      role: role ?? this.role,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState(role: 'visitor', isAuthenticated: false);
  }

  Future<bool> login(String email, String password, String role) async {
    final success = await ref.read(authRepositoryProvider).login(email, password, role);
    if (success) {
      state = AuthState(role: role, isAuthenticated: true);
    }
    return success;
  }

  Future<void> signUp(String email, String password) async {
    await ref.read(authRepositoryProvider).signUp(email, password);
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = AuthState(role: 'visitor', isAuthenticated: false);
  }
}

final authStateProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
