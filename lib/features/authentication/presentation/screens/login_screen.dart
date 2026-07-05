import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../core/theme/app_colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  
  bool _isLoginMode = true;
  bool _obscurePassword = true;
  bool _rememberMe = false;
  String _selectedRole = 'user'; // mock role: user or admin
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    try {
      final success = await ref.read(authStateProvider.notifier).login(
        _emailController.text,
        _passwordController.text,
        _selectedRole,
      );
      if (success && mounted) {
        if (_selectedRole == 'admin') {
          context.go('/admin/dashboard');
        } else {
          context.go('/user/dashboard');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Login failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred'), backgroundColor: Colors.redAccent),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _handleSignUp() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authStateProvider.notifier).signUp(
        _emailController.text,
        _passwordController.text,
      );
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Verify Your Email'),
            content: Text('A verification link has been sent to ${_emailController.text}. Please check your inbox and verify your email before logging in.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() => _isLoginMode = true);
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Registration failed'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred'), backgroundColor: Colors.redAccent),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF511080);
    const textGray = Color(0xFF888888);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 420,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mock Persona Toggle (At the top, clean, low-profile)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.shield, color: primaryPurple, size: 28),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedRole,
                            items: const [
                              DropdownMenuItem(value: 'user', child: Text('User View', style: TextStyle(fontSize: 12))),
                              DropdownMenuItem(value: 'admin', child: Text('Admin View', style: TextStyle(fontSize: 12))),
                            ],
                            onChanged: (val) => setState(() => _selectedRole = val!),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Header Texts
                  Text(
                    _isLoginMode ? 'Hi, Welcome Back! 👋' : 'Create an account',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isLoginMode 
                        ? 'Hello again, you\'ve been missed!' 
                        : 'Connect with your friends today!',
                    style: const TextStyle(
                      fontSize: 14,
                      color: textGray,
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Form Fields
                  const Text('Email Address', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 13)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: _isLoginMode ? 'sophat.leat@nintrea.live' : 'Enter your email',
                      hintStyle: const TextStyle(color: textGray),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  if (!_isLoginMode) ...[
                    const Text('Phone Number', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 13)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text('+855', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Enter your phonenumber',
                              hintStyle: const TextStyle(color: textGray),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],

                  const Text('Password', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 13)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: _isLoginMode ? 'Please Enter Your Password' : 'Enter a strong password',
                      hintStyle: const TextStyle(color: textGray),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: textGray, size: 20),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Remember Me & Forgot Password Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            activeColor: primaryPurple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            onChanged: (val) => setState(() => _rememberMe = val ?? false),
                          ),
                          const Text('Remember Me', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Primary Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      onPressed: _isLoading ? null : (_isLoginMode ? _handleLogin : _handleSignUp),
                      child: _isLoading 
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : Text(_isLoginMode ? 'Login' : 'Sign Up', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Divider
                  Row(
                    children: const [
                      Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Or With', style: TextStyle(color: textGray, fontSize: 12)),
                      ),
                      Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Social Logins
                  Row(
                    children: [
                      Expanded(
                        child: _SocialButton(
                          icon: FontAwesomeIcons.github,
                          label: 'GitHub',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _SocialButton(
                          icon: FontAwesomeIcons.gitlab,
                          label: 'GitLab',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Toggle Link
                  Center(
                    child: GestureDetector(
                      onTap: () => setState(() => _isLoginMode = !_isLoginMode),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                          children: [
                            TextSpan(text: _isLoginMode ? 'Don\'t have an account? ' : 'Already have an account? '),
                            TextSpan(
                              text: _isLoginMode ? 'Sign Up' : 'Login',
                              style: const TextStyle(color: primaryPurple, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 18, color: Colors.black),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
