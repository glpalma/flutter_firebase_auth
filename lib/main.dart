import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/core/di/injection_container.dart';
import 'package:flutter_firebase_auth/features/auth/ui/auth_viewmodel.dart';
import 'package:flutter_firebase_auth/features/auth/ui/home_screen.dart';
import 'package:flutter_firebase_auth/features/auth/ui/login/login_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = sl<AuthViewModel>();

    return MaterialApp(
      home: ListenableBuilder(
        listenable: authViewModel,
        builder: (context, child) {
          return (authViewModel.isLoggedIn ? HomeScreen() : LoginScreen());
        },
      ),
    );
  }
}
