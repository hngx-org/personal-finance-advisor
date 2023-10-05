import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:personal_finance_advisor/src/features/auth/screens/log_in_screen.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

import '../../auth/providers/user_provider.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userProvider);
    final isLoading = ref.watch(isLoadingProvider);

    Future<void> logOutUser() async {
      final authRepository = Authentication();
      ref.read(isLoadingProvider.notifier).state = true;

      try {
        await authRepository.logout(userDetails['email']!);
        // Go back to login screen
        if (!context.mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      } on ApiException catch (ex) {
        ref.read(isLoadingProvider.notifier).state = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ex.message,
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      } catch (otherExceptions) {
        ref.read(isLoadingProvider.notifier).state = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              otherExceptions.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'User Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(userDetails['name']!),
            ),
            const Spacing.mediumHeight(),
            ListTile(
              title: const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(userDetails['email']!),
            ),
            const Spacing.largeHeight(),
            ElevatedButton(
              onPressed: isLoading ? null : logOutUser,
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
