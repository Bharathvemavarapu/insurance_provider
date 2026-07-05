import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<bool> login(String email, String password, String role);
  Future<void> signUp(String email, String password);
  Future<void> logout();
  Future<String?> getCurrentUserRole();
  Future<bool> isEmailVerified();
  Future<void> sendVerificationEmail();
}

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _currentRole;

  @override
  Future<bool> login(String email, String password, String role) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    final user = userCredential.user;
    if (user != null) {
      if (!user.emailVerified) {
        await _auth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Your email address is not verified. Please verify your email first.',
        );
      }
      _currentRole = role;
      return true;
    }
    return false;
  }

  @override
  Future<void> signUp(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    _currentRole = null;
  }

  @override
  Future<String?> getCurrentUserRole() async {
    return _currentRole;
  }

  @override
  Future<bool> isEmailVerified() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      return _auth.currentUser!.emailVerified;
    }
    return false;
  }

  @override
  Future<void> sendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }
}
