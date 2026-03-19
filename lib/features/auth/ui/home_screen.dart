import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/core/di/injection_container.dart';
import 'package:flutter_firebase_auth/features/auth/ui/auth_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = sl<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: authViewModel.signOut,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, ${authViewModel.currentUser?.email ?? 'user'}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
