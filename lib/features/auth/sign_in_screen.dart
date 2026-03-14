import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../data/firebase/firebase_init.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool _isLoading = false;

  Future<void> _handleSignIn() async {
    setState(() => _isLoading = true);
    try {
      await signInWithGoogle();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ログインに失敗しました: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 72,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 24),
                Text('Any Planner', style: AppTypography.headline),
                const SizedBox(height: 8),
                Text(
                  'Jot it down. Sort it later.',
                  style: AppTypography.subtitle,
                ),
                const SizedBox(height: 48),
                _isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton.icon(
                        onPressed: _handleSignIn,
                        icon: const Icon(Icons.login),
                        label: const Text('Googleでサインイン'),
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 52),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
